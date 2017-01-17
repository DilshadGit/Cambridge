from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone

# Create your views here.
from .models import Home
from .forms import HomeForm
from django.contrib.auth.decorators import login_required, permission_required


def index_page_view(request):
    """
    Description:
        This handles the creation of an index page. The index page takes data from the Home model and renders. In this
        instance we only ever have 1 item in our table. This first item can be updated but not deleted. If it does not
        exist the page will contain an 'add' button to allow the user to add the first item to the page to be rendered.

    :param request:
        This takes a request object. It should contain:

    :return:
        render
        home.html template - containing the first Home object if it exists. Otherwise it contains the 'add' button.
        context - containing the Home object which will populate the template.
    """

    no_home_page_text = False
    try:
        home_main = Home.objects.get(pk=1)
        print "The title is: ", home_main.title
        print "The slug is: ", home_main.slug
        print "The main content is: ", home_main.content

    except Home.DoesNotExist:
        print "The home page does not exist. Make sure we can render the add button"
        no_home_page_text = True
        home_main = "Default Page"
        home_main.slug = "Default slug"
        home_main.name = "Default name"
        home_main.content = "Default content"

    print " This is the index_page view..."

    context = {'query_page': home_main,
               'no_text': no_home_page_text}

    return render(request, 'home.html', context)


@login_required
def create_index_view(request):
    print "Create index view"
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
    print "We are in update index..."
    print "The slug is: ", slug
    instance = get_object_or_404(Home, slug=slug)
    print "The instance slug is: ", instance.slug

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
