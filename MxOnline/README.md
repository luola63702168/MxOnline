# 项目概览
- 使用xadmin作为后台显示
- forms.Form和ModelForm表单作为表单验证系统
- captcha 作为验证码
- sina邮箱用于注册和找回密码（并没有用celery，所以阻塞，如果有需求，请自己添加）
- django-pure-pagination 实现分页