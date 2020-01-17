# coding: utf-8
from random import Random

from  django.core.mail import send_mail

from users.models import EmailVerifyRecord
from MxOnline.settings import EMAIL_FROM



def generate_random_str(random_length=8):
    '''生成随机字符串'''
    str_ = ''
    chars = 'qwertyuiopasfdghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789'
    length = len(chars)-2
    random = Random()
    for i in range(random_length):
        str_ += chars[random.randint(0,length)]
    return str_


def send_register_email(email,send_type="register"):
    '''发送邮件给注册邮箱'''
    # 保存至数据库
    email_record = EmailVerifyRecord()
    code = generate_random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    # 发送邮件
    email_title=""
    email_body=""

    if send_type == "register":
        email_title = "慕学在线网注册激活链接"
        email_body = "请点击下面的链接激活你的账户：http://127.0.0.1:8000/activate/{0}".format(code)
        # 发送邮件的有个htm_message参数，可以发送一个可以点击的url。
        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            print("ok")  # 在这里后续可以添加log日志

    elif send_type == "forget":
        email_title = "慕学在线网密码重置链接"
        email_body = "请点击下面的链接重置你的密码：http://127.0.0.1:8000/reset/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            print("ok")





