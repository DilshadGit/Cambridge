from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect


# Create your views here.
from .forms import PostForm
from .models import Post
from about.models import Page
from django.contrib.auth.decorators import login_required, permission_required


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

    title_page = Page.objects.all().order_by('-title')

    context = {
        'query_set': posts,
        'query_page': title_page
    }

    return render(request, 'posts.html', context)

# We only want a user who can login to be able to create posts
@login_required
def create_post(request):
    print "We are in 'create_post'"

    form = PostForm(request.POST or None, request.FILES or None)
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

    return render(request, 'create_post.html', context)


def post_details(request, slug=None):
    instance_obj = get_object_or_404(Post, slug=slug)
    title_page = Page.objects.all().order_by('-title')

    context = {
        'title': instance_obj.title,
        'content': instance_obj.content,
        'create_date': instance_obj.create_date,
        'image': instance_obj.image,
        'slug': instance_obj.slug,
        'query_page': title_page
    }
    return render(request, 'post_detail.html', context)


def update_post(request, slug=None):
    if not request.user.is_staff or not request.user.is_superuser:
        raise Http404
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
    # To render the page title on the navbar     
    title_page = Page.objects.all().order_by('-title')

    context = {
        'title': instance.title,
        'instance': instance.content,
        'form': form,
        'image': instance.image,
        'slug': instance.slug,
        'query_page': title_page
    }
    return render(request, 'post_update.html', context)


def delete_post(request, slug=None):
    if not request.user.is_staff or not request.user.is_superuser:
        raise Http404
    instance = get_object_or_404(Post, slug=slug)
    instance.delete()
    messages.success(request, 'Successfully Deleted ')
    return redirect('post:list_post')


