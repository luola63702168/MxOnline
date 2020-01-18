# coding: utf-8
from django import forms
from captcha.fields import CaptchaField

from users.models import UserProfile


class LoginFrom(forms.Form):
    '''登录表单'''
    username = forms.CharField(required=True)  # required=True 字段必须要有
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
