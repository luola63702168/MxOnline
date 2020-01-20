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
import xadmin

from django.conf.urls import url, include
from django.views.generic import TemplateView  # 处理模板文件的返回
from django.views.static import serve  # 处理上传文件的访问

from MxOnline.settings import MEDIA_ROOT
from users.views import IndexView

urlpatterns = [
    # path('xadmin/', xadmin.site.urls)
    url(r'xadmin/', xadmin.site.urls),  # xadmin后台管理
    url(r'^captcha/', include('captcha.urls')),  # 图片验证码

    # url(r'^$', TemplateView.as_view(template_name="index.html"), name="index"),
    url(r'^$', IndexView.as_view(), name="index"),

    # 用户URL
    url(r'^users/', include(('users.urls', "users"), namespace="users")),

    # 课程机构url
    url(r'^org/', include(('organization.urls', "organization"), namespace="org")),

    # 课程相关url
    url(r'^course/', include(('courses.urls', "courses"), namespace="course")),

    # 处理上传文件的访问(document_root,为处理函数的参数，意为该url下的文件到哪里去找
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    # 静态文件
    # url(r'^static/(?P<path>.*)$', serve, {"document_root": STATIC_ROOT}),

]

# 全局 404 页面配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'
