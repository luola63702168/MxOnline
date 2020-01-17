"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView  # 处理模板文件的返回
from django.views.static import serve  # 处理上传文件的访问
import xadmin

from users.views import LoginView,RegisterView,ActivateUserView,ForgetPwdView,ResetView,ModifyPwdView
from organization.views import OrgView
from MxOnline.settings import MEDIA_ROOT
urlpatterns = [
    # path('xadmin/', xadmin.site.urls)
    url(r'xadmin/', xadmin.site.urls),  # xadmin后台管理
    url(r'^captcha/', include('captcha.urls')),  # 图片验证码

    url(r'^$', TemplateView.as_view(template_name="index.html"), name="index"),

    # todo 用户页url(未放置userapp中的urls.py中)
    url(r'^login/$', LoginView.as_view(), name="login"),  # 登录 # 根目录匹配的时候是不需要“/”的所以要把/login/的“/”去掉
    url(r'^register/$', RegisterView.as_view(), name="register"),  # 注册
    url(r'^activate/(?P<activate_code>.*)$',ActivateUserView.as_view(),name="user_activate"),  # 激活
    url(r'^forget/$', ForgetPwdView.as_view(),name="forget_pwd"),  # 返回找回密码页面
    url(r'^reset/(?P<reset_code>.*)$', ResetView.as_view(), name="reset_pwd"),  # 找回密码
    url(r'^modify/$', ModifyPwdView.as_view(),name="modify_pwd"),  # 处理找回密码逻辑

    # 课程机构url
    url(r'^org/', include(('organization.urls', "organization"), namespace="org")),

    # 课程相关url
    url(r'^course/', include(('courses.urls', "courses"), namespace="course")),

    # 处理上传文件的访问(document_root,为处理函数的参数，意为该url下的文件到哪里去找
    url(r'^media/(?P<path>.*)$',serve,{"document_root":MEDIA_ROOT}),
]
