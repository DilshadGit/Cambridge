from django import forms

from .models import Contact


# class NewsForm(forms.ModelForm):
#     class Meta:
#         model = ContactForm
#         fields = ['title', 'author', 'image',
#                   'content', 'draft', 'publish_date']


class ContactForm(forms.Form):
    full_name = forms.CharField(label='Full Name', max_length=120, required=True)
    email = forms.EmailField(required=True)
    msg = forms.CharField(required=True, widget=forms.Textarea)

    # the new bit we're adding
    def __init__(self, *args, **kwargs):
        super(ContactForm, self).__init__(*args, **kwargs)
        self.fields['contact_name'].label = "Your name:"
        self.fields['contact_email'].label = "Your email:"
        self.fields['content'].label = "What do you want to say?"
