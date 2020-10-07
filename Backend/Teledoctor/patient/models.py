from django.db import models
from django.conf import settings

class Patient(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.get_full_name() + '(patient)'
