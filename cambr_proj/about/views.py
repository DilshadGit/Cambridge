from django.shortcuts import render

# Create your views here.


def index_page(request):
	context = ''
	return render(request, 'index.html', context)


def what_we_do(request):
	context = ''
	return render(request, 'what_we_doing.html', context)

def voluntering(request):
	context = ''
	return render(request, 'voluntery.html', context)

def our_team(request):
	context = ''
	return render(request, 'teams.html', context)

def our_board(request):
	context = ''
	return render(request, 'board.html', context)