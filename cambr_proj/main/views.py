from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone

# Create your views here.
from .models import Home
from .forms import HomeForm
from django.contrib.auth.decorators import login_required, permission_required



def index_page_view(request):
    data_obj = Home.objects.all()
    print data_obj
    context = {
        'query_page': data_obj,
    }
    return render(request, 'index.html', context)

@login_required
def create_index_view(request):
    form = HomeForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        obj_form = form.save(commit=False)
        # print form.cleaned_date.get('title')
        obj_form.save()
        # message successfully created
        messages.success(request, 'Successfully created ')
        return HttpResponseRedirect(obj_form.get_absolute_url())

    title_page = Home.objects.all().order_by('-title')
    context = {
        'form': form,
        'query_page': title_page
    }
    return render(request, 'index_form.html', context)


def detail_index_view(request, slug=None):
    instance_obj = get_object_or_404(Home, slug=slug)

    title_page = Home.objects.all().order_by('-title')
    context = {
        'title': instance_obj.title,
        'content': instance_obj.content,
        'create_date': instance_obj.create_date,
        'image': instance_obj.image,
        'slug': instance_obj.slug,
        'query_page': title_page
    }
     
    return render(request, 'index_detail.html', context)


@login_required
def update_index_view(request, slug=None):
    instance = get_object_or_404(Home, slug=slug)

    form = HomeForm(request.POST or None,
                    request.FILES or None, instance=instance)
    if form.is_valid():
        obj_form = form.save(commit=False)
        # print form.cleaned_date.get('title')
        obj_form.save()
        # message successfully updated
        messages.success(request, 'Successfully Updated ')
        return HttpResponseRedirect(obj_form.get_absolute_url())

    context = {
        'title': instance.title,
        'instance': instance.content,
        'form': form,
        'image': instance.image,
        'slug': instance.slug,
    }
    return render(request, 'index_update.html', context)

# @login_required
# def delete_index(request, slug=None):
#     instance = get_object_or_404(Home, slug=slug)
#     instance.delete()
#     messages.success(request, 'Successfully Deleted ')
#     return redirect('main:index')
