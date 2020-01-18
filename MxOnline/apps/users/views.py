import json

from django.shortcuts import render,redirect
from django.contrib.auth import authenticate, login, logout  # 验证账户密码
from django.contrib.auth.backends import ModelBackend  # 改变authenticate验证模式
from django.http import HttpResponse, HttpResponsePermanentRedirect
from django.urls import reverse
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password  # 加密密码

from users.models import UserProfile, EmailVerifyRecord
from users.forms import LoginFrom, RegisterForm, ForgetForm, ModifyPwdForm, UploadImageForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin


# Create your views here.


class CustomBackend(ModelBackend):
    '''改变authenticate验证模式'''

    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):
    '''登录'''

    def get(self, request):
        return render(request, "login.html", {})

    def post(self, request):
        login_form = LoginFrom(request.POST)  # 会把POST中对应字段的数据进行校验，所以html中name对应的value要和类中属性名一致。
        if login_form.is_valid():  # 成功就说明数据校验合格
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)  # 查看源码发现参数没有默认名的，是需要自己指定的
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return render(request, 'index.html', {})
                else:
                    return render(request, 'login.html', {"msg": "用户名未激活"})
            else:
                return render(request, 'login.html', {"msg": "用户名或密码错误"})
        else:
            return render(request, 'login.html', {"login_form": login_form})  # login_form 是一个字典，包含了谁错了和错误提示


class RegisterView(View):
    '''注册'''

    def get(self, request):
        register_form = RegisterForm()  # 这里是为了存储上一次提交表单的信息，让 register_form 自动的帮我们填在input的value中
        return render(request, "register.html", {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        # print(register_form,"*"*100)
        if register_form.is_valid():
            user_name = request.POST.get("email", "")
            if UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {"register_form": register_form, "msg": "用户已经存在"})
            pass_word = request.POST.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            user_profile.save()
            send_register_email(user_name, "register")

            return render(request, 'login.html')
        else:
            return render(request, 'register.html', {"register_form": register_form})


class ActivateUserView(View):
    '''邮箱激活'''

    def get(self, request, activate_code):
        # 这种生成随机字符串的方法，在数据库中有可能会存在一样的，所以需要将所有的都查出来；
        # 其实用from itsdangerous import TimedJSONWebSignatureSerializer as Serializer，可能会更好。
        all_records = EmailVerifyRecord.objects.filter(code=activate_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request, "activate_fail.html")
        return render(request, "login.html")


class ForgetPwdView(View):
    '''找回密码'''

    def get(self, request):
        forget_form = ForgetForm()
        return render(request, "forgetpwd.html", {"forget_form": forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email", '')
            send_register_email(email, "forget")
            return render(request, "send_success.html")
        else:
            return render(request, "forgetpwd.html", {"forget_form": forget_form})


class ResetView(View):
    '''重置密码'''

    def get(self, request, reset_code):
        all_records = EmailVerifyRecord.objects.filter(code=reset_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, "password_reset.html", {"email": email})
        else:
            return render(request, "activate_fail.html")
        return render(request, "login.html")


class ModifyPwdView(View):
    '''未登录时处理重置密码'''

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", '')
            pwd2 = request.POST.get("password2", '')
            email = request.POST.get("email", '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {"email": email, "msg": "密码不一致"})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd2)
            user.save()
            # 这里其实可以给EmailVerifyRecord模型类添加一个bool字段，来使用户重置密码后使链接失效
            # 也可以在给链接设置随机字符串的时候使用之有过期时间
            return render(request, 'login.html')
        else:
            email = request.POST.get("email", '')
            return render(request, 'password_reset.html', {"email": email, "modify_form": modify_form})


class UserInfoView(LoginRequiredMixin, View):
    """用户个人信息页"""

    def get(self, request):
        return render(request, 'usercenter-info.html')

    # 用户修改昵称，手机号，地址，生日
    # def post(self, request):
    #     user_info_form = UserInfoForm(request.POST, instance=request.user)
    #     res = dict()
    #
    #     if user_info_form.is_valid():
    #         user_info_form.save()
    #         res['status'] = 'success'
    #
    #     else:
    #         res = user_info_form.errors
    #
    #     return HttpResponse(json.dumps(res), content_type='application/json')


class LogoutView(View):
    """退出登录"""

    def get(self, request):
        logout(request)
        return redirect(reverse('index'))
        # 永久重定向会生成一个登录缓存，下次访问这个url的时候不会访问这个视图，而是直接利用缓存重定向到主页。
        # return HttpResponsePermanentRedirect(reverse('index'))


class UploadImageView(LoginRequiredMixin, View):
    """用户修改头像"""

    def post(self, request):
        # image_form = UploadImageForm(request.POST, request.FILES)
        # if image_form.is_valid():
        #     # 取出image文件对象
        #     image = image_form.cleaned_data['image']
        #     request.user.image = image
        #     request.user.save()

        # request.FILES 是文件传输时的特殊的存在，instance：代表此form是谁的form
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        res = dict()
        if image_form.is_valid():
            image_form.save()
            res['status'] = 'success'
            res['msg'] = '头像修改成功'
        else:
            res['status'] = 'fail'
            res['msg'] = '头像修改失败'
        return HttpResponse(json.dumps(res), content_type='application/json')


class UpdatePwdView(LoginRequiredMixin, View):
    """已登录修改密码（个人中心）"""

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        res = dict()

        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            if pwd1 != pwd2:
                res['status'] = 'fail'
                res['msg'] = '两次密码不一致'
                return HttpResponse(json.dumps(res), content_type='application/json')

            user = request.user
            user.password = make_password(pwd2)
            user.save()

            res['status'] = 'success'
            res['msg'] = '密码修改成功'
        else:
            res = modify_form.errors

        return HttpResponse(json.dumps(res), content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    """发送修改邮箱时的邮箱验证码"""

    def get(self, request):
        email = request.GET.get('email', '')
        res = dict()
        if UserProfile.objects.filter(email=email):
            res['email'] = '邮箱已注册'
            return HttpResponse(json.dumps(res), content_type='application/json')
        send_register_email(email, 'update_email')
        res['status'] = 'success'
        res['msg'] = '发送验证码成功'
        return HttpResponse(json.dumps(res), content_type='application/json')


class UpdateEmailView(LoginRequiredMixin, View):
    """修改个人邮箱"""

    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        res = dict()
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            res['status'] = 'success'
            res['msg'] = '邮箱修改成功！'
        else:
            res['status'] = 'fail'
            res['msg'] = '验证码出错！'

        return HttpResponse(json.dumps(res), content_type='application/json')
