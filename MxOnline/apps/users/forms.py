# coding: utf-8
from django import forms
from captcha.fields import CaptchaField

from users.models import UserProfile


class LoginFrom(forms.Form):
    '''登录表单'''
    username = forms.CharField(required=True)  # required=True 表示该字段必须要有
    password = forms.CharField(required=True, min_length=5)


class RegisterForm(forms.Form):
    '''注册表单'''
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)
    # error_messages 可以自定义错误，如果不自定义的话，默认是“认证没错误”,可以参考下面这段源码
    # raise ValidationError(getattr(self, 'error_messages', {}).get('invalid', ugettext_lazy('Invalid CAPTCHA')))
    captcha = CaptchaField(error_messages={"invalid": "验证码错误"})


class ForgetForm(forms.Form):
    '''找回密码'''
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid": "验证码错误"})


class ModifyPwdForm(forms.Form):
    '''密码修改'''
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)


class UploadImageForm(forms.ModelForm):
    """头像上传"""

    class Meta:
        model = UserProfile
        fields = ['image']


class UserInfoForm(forms.ModelForm):
    """用户个人信息页(保存)"""
    class Meta:
        model = UserProfile
        fields = ['nick_name', 'gender', 'birday', 'address', 'mobile']


# ModelForm 和 Form的区别，前者只可以校验，后者不仅可以校验，还可以修改。
