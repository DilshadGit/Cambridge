
from django.contrib import messages

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.core.mail import send_mail
from django.utils import timezone


# Create your views here.
# from cms.forms import NewsForm
from .forms import ContactForm


def contact(request):
    form_class = ContactForm
    if request.method == 'POST':
        form = ContactForm(data=request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            messages = form.cleaned_data['messages']
            sender = form.cleaned_data['sender']
            cc_myself = form.cleaned_data['cc_myself']

            recipients = ['info@gmail.com']
            if cc_myself:
                recipients.append(sender)
                send_mail(subject, messages, sender, recipients)
            return HttpResponseRedirect('/Thank you, Your email has been sent! /')
        else:
            form = ContactForm()
    context = {
        'form': form,
    }
    return render(request, 'contact.html', context)
