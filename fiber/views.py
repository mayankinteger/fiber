from django.shortcuts import render

def error_404(request, exception):
    return render(request, '4041.html')

def error_500(request):
    return render(request, '5001.html')