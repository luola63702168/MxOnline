# coding: utf-8
import xadmin

from courses.models import Course,Lesson,Video,CourseResource


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree','learn_times','students','fav_nums','image','click_nums','add_time']  # 显示字段
    search_fields = ['name', 'desc', 'detail', 'degree','learn_times','students','fav_nums','click_nums']  # 搜索字段
    list_filter = ['name', 'desc', 'detail', 'degree','learn_times','students','fav_nums','image','click_nums','add_time']  # 筛选字段


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']  # 第一列是修改该条数据的快速入口
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']  # course__name 使过滤器可通过外键过滤


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'download', 'name','add_time']
    search_fields = ['course', 'download', 'name']
    list_filter = ['course__name', 'download', 'name','add_time']


xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)



















