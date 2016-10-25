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
    logger.debug("In contact form...")
    form = ContactForm(request.POST or None)

    if form.is_valid():
        full_name = form.cleaned_data['full_name']
        subject = form.cleaned_data['subject']
        form_email = form.cleaned_data['form_email']
        message = form.cleaned_data['message']

        to_email = [settings.EMAIL_HOST_USER]

        if send_mail(subject, message, form_email, to_email, fail_silently=True):
            first_name = full_name.split()[0]               # Just take the fist name of the person to pass to the redirect page
            return HttpResponseRedirect((reverse('contact:contact_thanks_email', kwargs={'name':first_name})))
        else:
            pass

    context = {
        'form': form,
    }
    return render(request, 'contact.html', context)


def contact_thanks(request, name=None):
    logger.debug("Contact Successfully sent the email")
    logger.debug("The name passed to 'contact_thanks' is:{} ".format(name) )
    context={'name':name}

    return render(request, 'contact_success.html', context)