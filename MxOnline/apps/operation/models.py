from datetime import datetime

from django.db import models

from users.models import UserProfile
from courses.models import Course

# Create your models here.


class UserAsk(models.Model):
    '''用户咨询模型类'''
    name=models.CharField(max_length=20,verbose_name="姓名")
    mobile=models.CharField(max_length=11,verbose_name="手机")
    course_name = models.CharField(max_length=50,verbose_name="课程名")
    add_time=models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    class Meta:
        verbose_name="用户咨询"
        verbose_name_plural=verbose_name


class CourseComments(models.Model):
    '''课程评论模型类'''
    user = models.ForeignKey(UserProfile,verbose_name="用户",on_delete=models.CASCADE)
    course = models.ForeignKey(Course,verbose_name="课程",on_delete=models.CASCADE)
    comments = models.CharField(max_length=200,verbose_name="评论")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    class Meta:
        verbose_name = "课程评论"
        verbose_name_plural = verbose_name


class UserFavorite(models.Model):
    '''用户收藏'''
    user = models.ForeignKey(UserProfile,verbose_name="用户",on_delete=models.CASCADE)
    fav_id=models.IntegerField(default=0,verbose_name="数据id")  # 具体的课程或者课程机构或者讲师的id
    fav_type=models.IntegerField(choices=((1,"课程"),(2,"课程机构"),(3,"讲师")),default=1,verbose_name="收藏类型")  # 存的是究竟哪一种收藏
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    class Meta:
        verbose_name = "用户收藏"
        verbose_name_plural = verbose_name


class UserMessage(models.Model):
    '''用户消息'''
    user = models.IntegerField(default=0, verbose_name="接受用户")  # 不用外键，存的是用户id，不为0的时候是用户的id，为0的时候是群发消息。
    message = models.CharField(max_length=500, verbose_name="消息内容")
    has_read = models.BooleanField(default=False, verbose_name="是否已读")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="发送时间")

    class Meta:
        verbose_name = "用户消息"
        verbose_name_plural = verbose_name


class UserCourse(models.Model):
    '''用户课程'''
    user = models.ForeignKey(UserProfile, verbose_name="用户", on_delete=models.CASCADE)
    course = models.ForeignKey(Course, verbose_name="课程", on_delete=models.CASCADE)
    comments = models.CharField(default="空",max_length=50, verbose_name="描述信息")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "用户课程"
        verbose_name_plural = verbose_name












