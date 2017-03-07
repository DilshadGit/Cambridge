from django.contrib import admin

# Register your models here.

from .models import Home


class HomeAdmin(admin.ModelAdmin):

    class Meta:
        models = Home

admin.site.register(Home, HomeAdmin)
