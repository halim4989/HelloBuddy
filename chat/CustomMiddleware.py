# from django.utils.deprecation import MiddlewareMixin

from django.core.cache import cache

class ActiveUserMiddleware():

    # def process_request(self, request):
    #     print('*** process_request *** process_request ***')
    #     # print(request.META)
    #     # print(request.user.id)

    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.


        # CODE for CACHE memory
        username = request.user.username
        if request.user.is_authenticated:
            cache.set(username, 'online', 300) # delete after 5 min



        # print(request.META)
        response = self.get_response(request)
        # Code to be executed for each request/response after
        # the view is called.   
        return response






