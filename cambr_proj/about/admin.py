from django.contrib import admin

# Register your models here.

from .models import AboutUs


class AboutUsAdmin(admin.ModelAdmin):
    class Meta:
        models = AboutUs

admin.site.register(AboutUs, AboutUsAdmin)
