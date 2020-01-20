# coding: utf-8
from random import Random

from django.core.mail import send_mail

from users.models import EmailVerifyRecord
from MxOnline.settings import EMAIL_FROM


def generate_random_str(random_length=8):
    '''生成随机字符串'''
    str_ = ''
    chars = 'qwertyuiopasfdghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789'
    length = len(chars) - 2
    random = Random()
    for i in range(random_length):
        str_ += chars[random.randint(0, length)]
    return str_


def send_register_email(email, send_type="register"):
    '''发送邮件给注册邮箱'''
    # 保存至数据库
    email_record = EmailVerifyRecord()
    code = generate_random_str(16)
    if send_type == "update_email":
        code = generate_random_str(4)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    # 发送邮件
    email_title = ""
    email_body = ""

    if send_type == "register":
        email_title = "慕学在线网注册激活链接"
        email_body = "请点击下面的链接激活你的账户：http://127.0.0.1:8000/users/activate/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            print("ok")  # todo 在这里后续可以添加log日志

    elif send_type == "forget":
        email_title = "慕学在线网密码重置链接"
        email_body = "请点击下面的链接重置你的密码：http://127.0.0.1:8000/users/reset/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            print("ok")

    elif send_type == "update_email":
        email_title = "慕学在线网邮箱修改链接"
        email_body = "你的邮箱验证码为：{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            print("ok")
