from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


class LoginRequiredMixin(object):
    '''登录状态校验'''

    # method_decorator的作用是为函数视图装饰器补充第一个self参数，以适配类视图方法（ 解决self 参数的问题，被装饰的对象不是函数，而是类，也可以成功装饰。）
    # 等于在每个请求前装饰了 login_required
    # 如果向指定什么请求下才装饰login_required，可通过 name参数指定
    @method_decorator(login_required(login_url='/login/'))
    #  下面的是固定写法
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)
