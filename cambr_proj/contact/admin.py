from django.contrib import admin

# Register your models here.
from .models import Contact


class ContactAdmin(admin.ModelAdmin):

    class Meta:
        models = Contact

admin.site.register(Contact, ContactAdmin)
