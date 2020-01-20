# coding: utf-8
import xadmin

from courses.models import Course, Lesson, Video, CourseResource, BannerCourse
from organization.models import CourseOrg

class LessonInline(object):
    """添加课程的时候可以顺便添加章节(只能做一层嵌套)"""
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    """添加课程的时候可以顺便添加课程资源"""
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'image', 'click_nums',
                    'add_time', 'get_zj_nums', 'go_to']  # 显示字段(函数也行)
    search_fields = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums']  # 搜索字段
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'image', 'click_nums',
                   'add_time']  # 筛选字段
    # ordering = ['-click_nums'] # 配置该字段默认倒序排列
    # readonly_fields = ['click_nums']  # 配置该字段不可后台修改
    # exclude = ['fav_nums'] # 设置该字段后台不显示
    list_editable = ['degree', 'desc']  # 实现该字段可在列表页直接编辑
    inlines = [LessonInline, CourseResourceInline]  # 实现两个模型类可在一个模型类中进行添加操作
    refresh_times = [3, 5]  # 后台生成刷新图标，代表几秒刷新一次

    def queryset(self):
        """重载方法实现数据过滤"""
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)  # 此时该管理类只会管理is_banner这个字段 = False
        return qs

    def save_models(self):
        """重载做save时调用的方法
        实现添加课程的时候，课程机构统计的课程数量重新统计一次
        （这样即使是删除也会在下一次保存的时候更新其数量）
        """
        # 拿到被保存的这个对象的实例
        obj = self.new_obj
        obj.save()
        if obj.course_org:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()


class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'image', 'click_nums',
                    'add_time']  # 显示字段
    search_fields = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums']  # 搜索字段
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'image', 'click_nums',
                   'add_time']  # 筛选字段
    # ordering = ['-click_nums'] # 配置该字段默认倒序排列
    # readonly_fields = ['click_nums']  # 配置该字段不可后台修改
    # exclude = ['fav_nums'] # 设置该字段后台不显示
    inlines = [LessonInline, CourseResourceInline]

    def queryset(self):
        """实现数据过滤"""
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)  # 此时该管理类只会管理is_banner这个字段=True的数据
        return qs


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']  # 第一列是修改该条数据的快速入口
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']  # course__name 使过滤器可通过外键过滤


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'download', 'name', 'add_time']
    search_fields = ['course', 'download', 'name']
    list_filter = ['course__name', 'download', 'name', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)  # 实现一表多管理
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
