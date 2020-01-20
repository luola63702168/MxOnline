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
                    'add_time', 'get_zj_nums', 'go_to']
    search_fields = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'image', 'click_nums',
                   'add_time']
    # ordering = ['-click_nums']
    # readonly_fields = ['click_nums']
    # exclude = ['fav_nums']
    list_editable = ['degree', 'desc']
    inlines = [LessonInline, CourseResourceInline]
    refresh_times = [3, 5]

    def queryset(self):
        """重载方法实现数据过滤"""
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    def save_models(self):
        """重载做save时调用的方法，完成course更新course_nums统计
        """
        obj = self.new_obj
        obj.save()
        if obj.course_org:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()


class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'image', 'click_nums',
                    'add_time']
    search_fields = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'image', 'click_nums',
                   'add_time']
    # ordering = ['-click_nums'] # 配置该字段默认倒序排列
    # readonly_fields = ['click_nums']  # 配置该字段不可后台修改
    # exclude = ['fav_nums'] # 设置该字段后台不显示
    inlines = [LessonInline, CourseResourceInline]

    def queryset(self):
        """实现数据过滤"""
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


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
