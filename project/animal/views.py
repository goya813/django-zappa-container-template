from django.http import HttpResponse


def hello(request):
    content = "<html><head></head><body><p>Hello World</p></body></html>"
    return HttpResponse(content, status=200)
