from django.shortcuts import render

# Create your views here.


def get_support(request):
	context = ''
	return render(request, 'supports.html', context)


def refere_info(request):
	context = ''
	return render(request, 'refere_info.html', context)


def family_group(request):
	context = ''
	return render(request, 'families_groups.html', context)
