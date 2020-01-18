# coding: utf-8

import xadmin
from xadmin import views  # 主题

from users.models import EmailVerifyRecord, Banner


class BaseSetting(object):
    '''主题配置'''
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    '''标识配置'''
    site_title = "慕学后台管理系统"
    site_footer = "慕学在线网"
    menu_style = "accordion"  # 收起app


class EmailVerifyRecordAdmin(object):  # 不用继承admin.ModelAdmin的
    list_display = ['code', 'email', 'send_type', 'send_time']  # 显示字段
    search_fields = ['code', 'email', 'send_type']  # 搜索字段
    list_filter = ['code', 'email', 'send_type', 'send_time']  # 筛选字段


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index', 'add_time']  # 显示字段
    search_fields = ['title', 'image', 'url', 'index']  # 搜索字段
    list_filter = ['title', 'image', 'url', 'index', 'add_time']  # 筛选字段


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)  # 主题功能实现
xadmin.site.register(views.CommAdminView, GlobalSettings)  # logo 修改
# 文件adminx命名是必须的
