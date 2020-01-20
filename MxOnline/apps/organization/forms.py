# coding: utf-8
import re

from django import forms

from operation.models import UserAsk


# class UserAskForm(forms.Form):
#     '''我要学习表单'''
#     name = forms.CharField(required=True, min_length=2, max_length=20)
#     phone = forms.CharField(required=True, min_length=11, max_length=11)
#     course_name = forms.CharField(required=True, min_length=5,max_length=50)


# ModelForm
class UserAskForm(forms.ModelForm):
    '''另一个学习表单'''

    class Meta:
        model = UserAsk
        fields = ['name', 'mobile', 'course_name']

    def clean_mobile(self):
        '''校验手机号'''
        mobile = self.cleaned_data['mobile']  # 取出手机号
        REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|^176\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError("手机号非法", code="mobile_invalid")



