from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect

# Create your views here.
from .models import WhatWeDo, Volunterring, OurTeam, OurBoard


# def about_page(request):
#     context = ''
#     return render(request, 'about_us.html', context)


def index_page(request):
    context = ''
    return render(request, '../templates/index.html', context)


def what_wedo(request):
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


def create_page(request):
    # This will stop user to acces to create page without login
    if not request.user.is_staff or not request.user.is_superuser:
        raise Http404
    form = PostForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        obj_form = form.save(commit=False)
        # print form.cleaned_date.get('title')
        obj_form.save()
        # message successfully created
        messages.success(request, 'Successfully created ')
        return HttpResponseRedirect(obj_form.get_absolute_url())

    context = {
        'form': form,
    }

    return render(request, 'create_post.html', context)