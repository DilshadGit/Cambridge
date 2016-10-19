from django import forms


class ContactForm(forms.Form):
    full_name = forms.CharField(max_length=64, required=True)
    subject = forms.CharField(required=False)
    form_email = forms.EmailField(required=True)
    message = forms.CharField(required=True, widget=forms.Textarea)


    # # the new bit we're adding
    # def __init__(self, *args, **kwargs):
    #     super(ContactForm, self).__init__(*args, **kwargs)
    #     self.fields['full_name'].label = "Your name:"
    #     self.fields['subject'].label = "Subject:"
    #     self.fields['sender'].label = "Your email:"
    #     self.fields['message'].label = "Your message:"
