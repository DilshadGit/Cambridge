from django import forms

from .models import WhatWeDo, Volunterring, OurTeam, OurBoard

class WhatWeDoForm(forms.ModelForm):
    class Meta:
        model = WhatWeDo
        fields = [
            'title',
            'content',
            'image'
        ]


class VolunterringForm(forms.ModelForm):
    class Meta:
        model = Volunterring
        fields = [
            'title',
            'content',
            'image'
        ]


class OurTeamDoForm(forms.ModelForm):
    class Meta:
        model = OurTeam
        fields = [
            'title',
            'content',
            'image'
        ]


class OurBoardForm(forms.ModelForm):
    class Meta:
        model = OurBoard
        fields = [
            'title',
            'content',
            'image'
        ]
