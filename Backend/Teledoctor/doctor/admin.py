from django.contrib import admin

from .models import Doctor, Plan, Day


class DoctorAdmin(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'last_name', 'specialty', 'email', 'social_id', 'mc_code')
    search_fields = ('email', 'last_name', 'mc_code', 'social_id')

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


admin.site.register(Doctor, DoctorAdmin)
admin.site.register(Plan)
admin.site.register(Day)
