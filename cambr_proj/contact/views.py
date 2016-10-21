# from django.contrib import messages

import logging

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.conf import settings
from django.core.mail import send_mail
from django.core.urlresolvers import reverse
from .forms import ContactForm

logger = logging.getLogger(__name__)

def contact(request):
    print "In contact form..."
    logger.debug("In contact form...")
    form = ContactForm(request.POST or None)

    if form.is_valid():
        print "Form is valid"
        full_name = form.cleaned_data['full_name']
        subject = form.cleaned_data['subject']
        form_email = form.cleaned_data['form_email']
        message = form.cleaned_data['message']
        print "Full name is: ", full_name, "\nSubject is: ", subject, "\nForm email is: ", form_email, "\nMessage is: ", message

        print "I'm getting the settings EMAIL_HOST_USER as: ", settings.EMAIL_HOST_USER
        to_email = [settings.EMAIL_HOST_USER]

        #send_mail(subject, message, form_email, to_email, fail_silently=True)
        if send_mail(subject, message, form_email, to_email, fail_silently=True):
            #return HttpResponseRedirect(reverse('arch-summary', args=[1945]))
            return HttpResponseRedirect('/contact/thanks')
        else:
            pass

    context = {
        'form': form,
    }
    return render(request, 'contact.html', context)


def contact_thanks(request):
    logger.debug("Contact Successfully sent the email")

    return render(request, 'contact_success.html')