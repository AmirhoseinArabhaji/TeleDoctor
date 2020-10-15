from django.db import models
from django.conf import settings
from doctor.models import Doctor

class Patient(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='users_user')
    favorite = models.ManyToManyField(Doctor, related_name='favorite', symmetrical=False, blank=True)

    def __str__(self):
        return self.user.get_full_name()


class Visit(models.Model):
    patient = models.ForeignKey(
        'Patient',
        on_delete=models.CASCADE,
    )
    doctor = models.ForeignKey(
        'doctor.Doctor',
        on_delete=models.CASCADE,
    )
    date = models.DateField(auto_now=False, auto_now_add=False)
    time = models.TimeField(auto_now=False, auto_now_add=False)
    title = models.CharField(max_length=100)
    detail = models.TextField()

    def __str__(self):
        return 'patient: ' + str(self.patient) + ', doctor: ' + str(self.doctor) + ', title: ' + self.title
