from django.contrib import admin

# Register your models here.

from .models import WhatWeDo, Volunterring, OurTeam, OurBoard


# class AboutUsAdmin(admin.ModelAdmin):
#     class Meta:
#         models = AboutUs

# admin.site.register(AboutUs, AboutUsAdmin)

class WhatWeDoAdmin(admin.ModelAdmin):
    class Meta:
        models = WhatWeDo

class VolunterringAdmin(admin.ModelAdmin):
    class Meta:
        models = Volunterring

class OurTeamAdmin(admin.ModelAdmin):
    class Meta:
        models = OurTeam

class OurBoardAdmin(admin.ModelAdmin):
    class Meta:
        models = OurBoard

admin.site.register(WhatWeDo, WhatWeDoAdmin)
admin.site.register(Volunterring, VolunterringAdmin)
admin.site.register(OurTeam, OurTeamAdmin)
admin.site.register(OurBoard, OurBoardAdmin)
