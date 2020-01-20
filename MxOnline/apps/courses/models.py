from datetime import datetime

from django.db import models

from organization.models import CourseOrg, Teacher


# Create your models here.


class Course(models.Model):
    '''课程模型类'''
    course_org = models.ForeignKey(CourseOrg, verbose_name="课程机构", null=True, blank=True, on_delete=models.CASCADE)
    name = models.CharField(max_length=50, verbose_name="课程名")
    desc = models.CharField(max_length=300, verbose_name="课程描述")
    detail = models.TextField(verbose_name="课程详情")
    is_banner = models.BooleanField(default=False, verbose_name='是否是轮播图')
    teacher = models.ForeignKey(Teacher, verbose_name="讲师", null=True, blank=True, on_delete=models.CASCADE)
    degree = models.CharField(max_length=2, verbose_name="难度", choices=(("cj", "初级"), ("zj", "中级"), ("gj", "高级")))
    learn_times = models.IntegerField(default=0, verbose_name="学习时常（分钟数）")
    students = models.IntegerField(default=0, verbose_name="学习人数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏人数")
    image = models.ImageField(upload_to="courses/%Y/%m", verbose_name="封面图", max_length=100)
    category = models.CharField(default='后端开发', max_length=20, verbose_name="课程类别")
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    tag = models.CharField(default="", verbose_name="课程标签", max_length=10)
    you_need_know = models.CharField(max_length=300, default='', verbose_name="课程须知")
    teacher_tell = models.CharField(max_length=300, default='', verbose_name="老师告诉你能学到什么")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.name

    def get_zj_nums(self):
        '''取章节数'''
        return self.lesson_set.all().count()
        # 下面这种情况，取得是所有得章节数，而不是该对象得章节数，当然，也可以在view.py中进行关联查询并返回，这里怎样顺手怎样来
        # return Lesson.objects.all().count()

    # 给这个函数变量添加一个变量，后台便会显示其相对 verbose_name 的名字了
    get_zj_nums.short_description = "章节数"

    def go_to(self):
        # 不允许转义，以链接的形式展示
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='https://www.baidu.com/'>跳转</a>")

    go_to.short_description = "跳转"

    def get_learn_users(self):
        '''学习用户'''
        return self.usercourse_set.all()[:5]

    def get_course_lesson(self):
        '''获取课程所有章节'''
        return self.lesson_set.all()

    class Meta:
        verbose_name = "课程"
        verbose_name_plural = verbose_name


class BannerCourse(Course):
    """实现Course一表多管理"""

    class Meta:
        verbose_name = "轮播课程"
        verbose_name_plural = verbose_name
        # 如果不设置 proxy ，就会再生成一个 BannerCourse 数据表
        proxy = True


class Lesson(models.Model):
    '''章节模型类'''
    course = models.ForeignKey(Course, verbose_name="课程", on_delete=models.CASCADE)  # django2新特性，删除主表时从表的数据一起删除
    name = models.CharField(max_length=100, verbose_name="章节名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "章节"
        verbose_name_plural = verbose_name

    def get_lesson_video(self):
        """获取章节视频信息"""
        return self.video_set.all()


class Video(models.Model):
    '''章节视频模型类'''
    lesson = models.ForeignKey(Lesson, verbose_name="章节", on_delete=models.CASCADE)
    learn_times = models.IntegerField(default=0, verbose_name="学习时常（分钟数）")
    name = models.CharField(max_length=100, verbose_name="视频名")
    url = models.CharField(max_length=200, default='', verbose_name="访问地址")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "视频"
        verbose_name_plural = verbose_name


class CourseResource(models.Model):
    '''课程资源'''
    course = models.ForeignKey(Course, verbose_name="课程", on_delete=models.CASCADE)  # django2新特性，删除主表时从表的数据一起删除
    download = models.FileField(upload_to="course/resource/%Y/%m", verbose_name="资源文件", max_length=100)
    name = models.CharField(max_length=100, verbose_name="名称")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "课程资源"
        verbose_name_plural = verbose_name
