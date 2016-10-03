from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect


# Create your views here.
from .forms import PostForm
from .models import Post


def list_post(request):
    posts_list = Post.objects.all().order_by('-create_date')
    paginator = Paginator(posts_list, 7)  # Show 25 posts per page
    page = request.GET.get('page')
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        posts = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        posts = paginator.page(paginator.num_pages)
    context = {
        'query_set': posts,
        # 'title': 'title',
        # 'content': 'content',
        # 'create_date': 'Public Date',
    }

    return render(request, 'posts.html', context)


def backend_posts(request):
    posts_list = Post.objects.all().order_by('-create_date')
    paginator = Paginator(posts_list, 7)  # Show 25 posts per page
    page = request.GET.get('page')
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        posts = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        posts = paginator.page(paginator.num_pages)
    context = {
        'query_set': posts,
        # 'title': 'title',
        # 'content': 'content',
        # 'create_date': 'Public Date',
    }
    return render(request, 'backend_post_list.html', context)


def create_post(request):
    form = PostForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        obj_form = form.save(commit=False)
        # print form.cleaned_date.get('title')
        obj_form.save()
        # message successfully created
        messages.success(request, 'Successfully created ')
        return HttpResponseRedirect(obj_form.get_absolute_url())
    # else:
    # 	messages.error(request, 'Error the post not created ')
    # if request.method == 'POST':
    # 	title = request.POST.get('title')
    # 	content = request.POST.get('content')
    # 	print request.POST
    context = {
        'form': form,
    }

    return render(request, 'create_post.html', context)


def post_details(request, slug=None):
    instance_obj = get_object_or_404(Post, slug=slug)

    context = {
        'title': instance_obj.title,
        'content': instance_obj.content,
        'create_date': instance_obj.create_date,
        'image': instance_obj.image,
    }
    return render(request, 'post_detail.html', context)


def update_post(request, slug=None):
    instance = get_object_or_404(Post, slug=slug)

    form = PostForm(request.POST or None,
                    request.FILES or None, instance=instance)
    if form.is_valid():
        obj_form = form.save(commit=False)
        # print form.cleaned_date.get('title')
        obj_form.save()
        # message successfully updated
        messages.success(request, 'Successfully Updated ')
        return HttpResponseRedirect(obj_form.get_absolute_url())
    # else:
    # 	messages.error(request, 'Error not updated ')
    context = {
        'title': instance.title,
        'instance': instance,
        'form': form,
    }
    return render(request, 'create_post.html', context)


def delete_post(request, slug=None):
    instance = get_object_or_404(Post, slug=slug)
    instance.delete()
    messages.success(request, 'Successfully Deleted ')
    return redirect('posts:list_post')
