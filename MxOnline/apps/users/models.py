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


class EmailVerifyRecord(models.Model):
    '''邮箱模型类'''
    code = models.CharField(max_length=20, verbose_name="验证码")
    email = models.EmailField(max_length=50, verbose_name="邮箱")
    send_type = models.CharField(choices=(("register", "注册"), ("forget", "找回密码"),('update_email', '修改邮箱')),verbose_name="验证码类型",
                                 max_length=18)  # 邮箱验证码，不仅仅在注册的时候需要用，在找回密码的时候也是可以用的。
    send_time = models.DateTimeField(default=datetime.now,verbose_name="发送时间")  # datetime.now 不能带括号，若不然就是编译时的时间

    def __str__(self):
        return "邮箱："+self.email+" 验证码："+self.code

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

# 当一个模型类和谁都没有关系的时候，是可以定义在一个app中的，这个app是不限的，一般是定义在usersApp中的
# 1. default=datetime.now()
#     model每次初始化，都会自动设置该字段的默认值为初始化时间。
#
# 2. default=datetime.now
#     model每次进行新增或修改操作，都会自动设置该字段的值为操作时间。设置后仍可以使用ORM手动修改该字段。
#
# 3. auto_now_add=True
#     默认值为False，若设置为True，model每次进行新增操作，都会自动设置该字段的值为操作时间。设置为True后无法使用ORM手动修改该字段，哪怕填充了字段的值也会被覆盖。
#
# 4. auto_now=True
#     默认值为False，若设置为True，model每次进行新增或修改操作，都会自动设置该字段的值为操作时间。设置为True后无法使用ORM手动修改该字段，哪怕填充了字段的值也会被覆盖。
#
