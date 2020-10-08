from django.db import models
from django.conf import settings

class Doctor(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    mc_code = models.PositiveIntegerField(blank=True, null=True) # Medical Council Code

    def __str__(self):
        return self.user.get_full_name() + '(doctor)'

