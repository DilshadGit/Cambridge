from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone

# Create your views here.
from .models import Page
from .forms import PageForm
from django.contrib.auth.decorators import login_required, permission_required

# def about_page(request):
#     context = ''
#     return render(request, 'about_us.html', context)


def index_page(request):
    title_page = Page.objects.all().order_by('-title')
    context = {
        'query_page': title_page
    }

    return render(request, '../templates/index.html', context)

def list_page(request):
    query_page = Page.objects.filter(
            create_date=timezone.now()).order_by('-title')
    # title_page = Page.objects.all().order_by('-title')
    context = {
        'query_page': title_page,
    }

    return render(request, 'pages.html', context)


def team_page(request):
    title_page = Page.objects.all().order_by('-title')
    context = {
        'query_page': title_page
    }

    return render(request, 'our_team.html', context)



# We only want a user who can login to be able to create posts
@login_required
def create_page(request):
    form = PageForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        obj_form = form.save(commit=False)
        # print form.cleaned_date.get('title')
        obj_form.save()
        # message successfully created
        messages.success(request, 'Successfully created ')
        return HttpResponseRedirect(obj_form.get_absolute_url())

    title_page = Page.objects.all().order_by('-title')
    context = {
        'form': form,
        'query_page': title_page
    }

    return render(request, 'page_form.html', context)


def detail_page(request, slug=None):

    instance_obj = get_object_or_404(Page, slug=slug)

    title_page = Page.objects.all().order_by('-title')
    context = {
        'title': instance_obj.title,
        'content': instance_obj.content,
        'create_date': instance_obj.create_date,
        'image': instance_obj.image,
        'slug': instance_obj.slug,
        'query_page': title_page
    }
     
    return render(request, 'page_detail.html', context)


def update_page(request, slug=None):
    if not request.user.is_staff or not request.user.is_superuser:
        raise Http404
    instance = get_object_or_404(Page, slug=slug)

    form = PageForm(request.POST or None,
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
    return render(request, 'page_update.html', context)


def delete_page(request, slug=None):
    if not request.user.is_staff or not request.user.is_superuser:
        raise Http404
    instance = get_object_or_404(Page, slug=slug)
    instance.delete()
    messages.success(request, 'Successfully Deleted ')
    return redirect('about:index')