from django.shortcuts import render

# Create your views here.


def dontaes(request):
	context = ''
	return render(request, 'donates_now.html', context)


def support_us(request):
	context = ''
	return render(request, 'supports_us.html', context)