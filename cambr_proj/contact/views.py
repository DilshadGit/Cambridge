# from django.contrib import messages

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.conf import settings
from django.core.mail import send_mail
from django.utils import timezone

from .forms import ContactForm


def contact(request):
    form = ContactForm(request.POST or None)

    if form.is_valid():
        full_name = form.cleaned_data['full_name']
        subject = form.cleaned_data['subject']
        form_email = form.cleaned_data['form_email']
        message = form.cleaned_data['message']
        # print full_name, subject, email, message

        form_email = settings.EMAIL_HOST_USER
        to_email = [form_email, 'office@homestartcambridgeshire.co.uk']

        send_mail(subject, message, form_email, to_email, fail_silently=True)
        if send_mail(subject, message, form_email, to_email, fail_silently=True):
            return HttpResponseRedirect('/Thank you, Your email has been sent! /')

    context = {
        'form': form,
    }
    return render(request, 'contact.html', context)
