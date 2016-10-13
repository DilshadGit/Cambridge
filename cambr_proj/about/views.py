from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect

# Create your views here.
from .models import WhatWeDo, Volunterring, OurTeam, OurBoard


def index_page(request):
    context = ''
    return render(request, '../templates/index.html', context)


# def about_page(request):
#     context = ''
#     return render(request, 'about_us.html', context)


def what_we_do(request):
    queryset = WhatWeDo.objects.all()
    context = {
        'content_data': queryset,  
    }
    return render(request, 'what_we_do.html', context)


def volunter_page(request):
    queryset = Volunterring.objects.all()
    context = {
        'content_data': queryset,  
    }
    return render(request, 'volunterring.html', context)


def team_page(request):
    queryset = OurTeam.objects.all()
    context = {
        'content_data': queryset,  
    }
    return render(request, 'teams.html', context)


def board_page(request):
    queryset = OurBoard.objects.all()
    context = {
        'content_data': queryset,  
    }
    return render(request, 'board.html', context)
