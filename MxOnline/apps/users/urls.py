from django.conf.urls import url, include

from users.views import LoginView, RegisterView, ActivateUserView, ForgetPwdView, ResetView, ModifyPwdView, \
    UserInfoView, LogoutView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView, \
    MyFavOrgView, MyFavTeacherView, MyFavCourseView, MyMessageView

urlpatterns = [
    url(r'^login/$', LoginView.as_view(), name="login"),  # 登录 # 根目录匹配的时候是不需要“/”的所以要把/login/的“/”去掉
    url(r'^register/$', RegisterView.as_view(), name="register"),  # 注册
    url(r'^activate/(?P<activate_code>.*)$', ActivateUserView.as_view(), name="user_activate"),  # 激活
    url(r'^forget/$', ForgetPwdView.as_view(), name="forget_pwd"),  # 返回找回密码页面
    url(r'^reset/(?P<reset_code>.*)$', ResetView.as_view(), name="reset_pwd"),  # 找回密码
    url(r'^modify/$', ModifyPwdView.as_view(), name="modify_pwd"),  # 处理找回密码逻辑

    url(r'^logout/$', LogoutView.as_view(), name='logout'),  # 退出登录
    url(r'^info/$', UserInfoView.as_view(), name="user_info"),  # 用户信息页及信息页个人资料修改
    url(r'^image/upload/$', UploadImageView.as_view(), name='image_upload'),  # 用户头像修改
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name='update_pwd'),  # 用户个人中心修改密码
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name='sendemail_code'),  # 修改邮箱时 发送邮箱验证码
    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),  # 修改邮箱时，验证邮箱和验证码
    url(r'^mycourse/$', MyCourseView.as_view(), name='mycourse'),  # 我的课程
    url(r'^myfav/org/$', MyFavOrgView.as_view(), name='myfav_org'),  # 我收藏的课程机构
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name='myfav_teacher'),  # 我收藏的授课讲师
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name='myfav_course'),  # 我收藏的课程
    url(r'^mymessage/$', MyMessageView.as_view(), name='mymessage'),  # 我的消息

]

