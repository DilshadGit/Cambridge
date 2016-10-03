from django.contrib import admin

# Register your models here.
from .models import Post


class PostAdmin(admin.ModelAdmin):

    class Meta:
        model = Post

    list_display = ('title', 'create_date', 'updated')
    search_fields = ['title', 'create_date', 'updated']
    list_filter = ['create_date']

admin.site.register(Post, PostAdmin)
