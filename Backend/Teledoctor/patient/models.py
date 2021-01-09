from django.db import models
from django.conf import settings
from doctor.models import Doctor


class Patient(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='patient')
    insurance_id = models.CharField(max_length=15, null=True, blank=False)
    insurance_organ = models.CharField(max_length=30, null=True, blank=False)
    booklet_expire_date = models.DateField(auto_now=False, auto_now_add=False, null=True, blank=False)
    booklet_code = models.CharField(max_length=15, null=True, blank=False)
    favorite = models.ManyToManyField(Doctor, related_name='favorite', symmetrical=False)

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
    date = models.DateField(auto_now=False, auto_now_add=False, null=False, blank=False)
    time = models.TimeField(auto_now=False, auto_now_add=False, null=False, blank=False)
    title = models.CharField(max_length=100, null=False, blank=False)
    detail = models.TextField(null=False, blank=False)

    def __str__(self):
        return 'patient: ' + str(self.patient) + ', doctor: ' + str(self.doctor) + ', title: ' + self.title
