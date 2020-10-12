from django.contrib import admin

from .models import Patient, Visit

admin.site.register(Patient)
admin.site.register(Visit)