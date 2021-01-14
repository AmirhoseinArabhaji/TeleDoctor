from django.contrib import admin

from .models import Patient, Visit


class PatientAdmin(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'last_name', 'email', 'social_id',)
    search_fields = ('email', 'last_name', 'social_id')

    def first_name(self, obj):
        return obj.user.first_name

    def last_name(self, obj):
        return obj.user.last_name

    def email(self, obj):
        return obj.user.email

    def social_id(self, obj):
        return obj.user.social_id

    def id(self, obj):
        return obj.user.id


class VisitAdmin(admin.ModelAdmin):
    list_display = ('id', 'date', 'time', 'doctor', 'patient', 'cost')


admin.site.register(Patient, PatientAdmin)
admin.site.register(Visit, VisitAdmin)
