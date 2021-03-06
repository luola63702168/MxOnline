from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.


class UserProfile(AbstractUser):
    '''用户模型类'''
    nick_name = models.CharField(max_length=50, verbose_name="昵称", default="")
    birday = models.DateField(verbose_name="生日", null=True, blank=True)
    gender = models.CharField(max_length=7, choices=(("male", "男"), ("female", "女")), default="female")
    address = models.CharField(max_length=100, default="")
    mobile = models.CharField(max_length=11, null=True, blank=True)
    image = models.ImageField(upload_to="image/%Y/%m", default="image/default.png", max_length=100)

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

    def get_unread_nums(self):
        """获取用户未读数据数量"""
        # 避免循环import
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id, has_read=False).count()


class EmailVerifyRecord(models.Model):
    '''邮箱模型类'''
    code = models.CharField(max_length=20, verbose_name="验证码")
    email = models.EmailField(max_length=50, verbose_name="邮箱")
    send_type = models.CharField(choices=(("register", "注册"), ("forget", "找回密码"), ('update_email', '修改邮箱')),
                                 verbose_name="验证码类型",
                                 max_length=18)
    send_time = models.DateTimeField(default=datetime.now, verbose_name="发送时间")

    def __str__(self):
        return "邮箱：" + self.email + " 验证码：" + self.code

    class Meta:
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name


class Banner(models.Model):
    '''轮播图模型类'''
    title = models.CharField(max_length=100, verbose_name="标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name="轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name="访问地址")
    index = models.IntegerField(default=100, verbose_name="顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name

