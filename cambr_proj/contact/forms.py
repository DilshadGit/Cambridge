from django import forms


class ContactForm(forms.Form):
    full_name = forms.CharField(max_length=64, required=True)
    subject = forms.CharField(required=False)
    form_email = forms.EmailField(required=True)
    message = forms.CharField(required=True, widget=forms.Textarea)

