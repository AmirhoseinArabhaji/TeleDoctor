from django.db import models
from django.conf import settings


class Doctor(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='doctor')
    mc_code = models.PositiveIntegerField(null=True, blank=False)  # Medical Council Code
    specialty = models.CharField(max_length=50, null=True, blank=False)

    def __str__(self):
        return self.user.get_full_name()


class Plan(models.Model):
    doctor = models.OneToOneField('Doctor', on_delete=models.CASCADE, related_name='plan')

    def __str__(self):
        return self.doctor.user.get_full_name()


class Day(models.Model):
    plan = models.ForeignKey('Plan', on_delete=models.CASCADE)
    visit_count = models.PositiveIntegerField(null=True, blank=False, default=0)
    reserved = models.PositiveIntegerField(null=True, blank=False, default=0)
    date = models.DateField(auto_now_add=False, auto_now=False, null=False, blank=False)

    class Meta:
        unique_together = ['date', 'plan']

    def __str__(self):
        return self.plan.doctor.user.get_full_name()
