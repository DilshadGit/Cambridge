from django import forms

from .models import Contact


# class NewsForm(forms.ModelForm):
#     class Meta:
#         model = ContactForm
#         fields = ['title', 'author', 'image',
#                   'content', 'draft', 'publish_date']


class ContactForm(forms.Form):
    full_name = forms.CharField(label='Full Name', max_length=120)
    email = forms.EmailField()
    msg = forms.Textarea()
