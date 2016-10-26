from django.contrib import admin

# Register your models here.

from .models import Page


# class AboutUsAdmin(admin.ModelAdmin):
#     class Meta:
#         models = AboutUs

# admin.site.register(AboutUs, AboutUsAdmin)

class PageAdmin(admin.ModelAdmin):
    class Meta:
        models = Page

admin.site.register(Page, PageAdmin)

