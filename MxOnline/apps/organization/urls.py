# coding: utf-8
from django.conf.urls import url, include

from organization.views import OrgView, AddUserAskView, OrgHomeView, OrgCourseView, OrgDescView, OrgTeacherView,AddFavView,TeacherListView,TeacherDetailView

urlpatterns = [
    url(r'^list/$', OrgView.as_view(), name="org_list"),  # 课程机构列表页
    url(r'^add_ask/$', AddUserAskView.as_view(), name="add_ask"),  # 咨询栏提交
    url(r'^home/(?P<org_id>\d+)/$', OrgHomeView.as_view(), name="org_home"),  # 机构首页
    url(r'^course/(?P<org_id>\d+)/$', OrgCourseView.as_view(), name="org_course"),  # 机构课程
    url(r'^desc/(?P<org_id>\d+)/$', OrgDescView.as_view(), name="org_desc"),  # 机构课程介绍
    url(r'^teacher/(?P<org_id>\d+)/$', OrgTeacherView.as_view(), name="org_teacher"),  # 机构教师页
    url(r'^add_fav/$', AddFavView.as_view(), name="add_fav"),  # 机构收藏

    url(r'^teacher/list/$', TeacherListView.as_view(), name='teacher_list'),  # 讲师列表页
    url(r'^teacher/detail/(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(), name='teacher_detail'),  # 讲师详情页

]
