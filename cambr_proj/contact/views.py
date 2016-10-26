# from django.contrib import messages

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.conf import settings
from django.core.mail import send_mail
from django.utils import timezone

from .forms import ContactForm
from about.models import Page


def contact(request):
    form = ContactForm(request.POST or None)

    if form.is_valid():
        full_name = form.cleaned_data['full_name']
        subject = form.cleaned_data['subject']
        form_email = form.cleaned_data['form_email']
        form_message = form.cleaned_data['message']
        # print full_name, subject, email, message

        subject = 'Contact Form'
        form_email = settings.EMAIL_HOST_USER
        to_email = [form_email, 'office@homestartcambridgeshire.co.uk']
        contact_message = '%s: %s via %s'%(
                            full_name, 
                            form_message, 
                            form_email
                        )

        send_mail(subject, form_message, form_email, to_email, fail_silently=False)
        if send_mail(subject, form_message, form_email, to_email, fail_silently=False):
            return HttpResponseRedirect('/Thank you, Your email has been sent! /')

    title_page = Page.objects.all().order_by('-title')
    
    context = {
        'form': form,
        'query_page': title_page
    }
    return render(request, 'contact.html', context)
