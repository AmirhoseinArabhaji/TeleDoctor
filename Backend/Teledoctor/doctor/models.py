from django.db import models
from django.conf import settings


class Doctor(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='doctor')
    mc_code = models.PositiveIntegerField(null=True, blank=True)  # Medical Council Code
    specialty = models.CharField(max_length=50, null=True, blank=False)

    def __str__(self):
        return self.user.get_full_name()
