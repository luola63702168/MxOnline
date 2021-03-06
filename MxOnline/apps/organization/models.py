from django.db import models
from datetime import datetime


# Create your models here.


class CityDict(models.Model):
    '''城市模型类'''
    name = models.CharField(max_length=20, verbose_name="城市")
    desc = models.CharField(max_length=200, verbose_name="描述")  # 利于数据分析
    add_time = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "城市"
        verbose_name_plural = verbose_name


class CourseOrg(models.Model):
    '''课程机构基本信息'''
    name = models.CharField(max_length=50, verbose_name="机构名称")
    desc = models.TextField(verbose_name="机构描述")
    tag = models.CharField(default="知名大学", max_length=10, verbose_name="机构标签")
    category = models.CharField(max_length=20, default="pxjg",
                                choices=(("pxjg", "培训机构"), ("geren", "个人"), ("gx", "高校")), verbose_name="机构类别")
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏数")
    image = models.ImageField(upload_to="org/%Y/%m", verbose_name="logo")
    address = models.CharField(max_length=150, verbose_name="机构地址")
    city = models.ForeignKey(CityDict, verbose_name="所在城市", on_delete=models.CASCADE)
    students = models.IntegerField(default=0, verbose_name="学习人数")
    course_nums = models.IntegerField(default=0, verbose_name="课程数")
    add_time = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    def get_teacher_num(self):
        return self.teacher_set.all().count()

    class Meta:
        verbose_name = "课程机构"
        verbose_name_plural = verbose_name


class Teacher(models.Model):
    '''老师信息'''
    org = models.ForeignKey(CourseOrg, verbose_name="所属机构", on_delete=models.CASCADE)
    name = models.CharField(max_length=50, verbose_name="教师名")
    work_years = models.IntegerField(default=0, verbose_name="工作年限")
    work_company = models.CharField(max_length=50, verbose_name="就职公司")
    work_position = models.CharField(max_length=50, verbose_name="公司职位")
    points = models.CharField(max_length=50, verbose_name="教学特点")
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    image = models.ImageField(default='', upload_to="teacher/%Y/%m", verbose_name="头像", max_length=100)
    age = models.IntegerField(default=18, verbose_name="年龄")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏数")
    add_time = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "老师"
        verbose_name_plural = verbose_name

    def get_course_nums(self):
        return self.course_set.all().count()
