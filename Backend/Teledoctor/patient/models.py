from django.db import models

class Patient(models.Model):
    
    first_name = models.CharField(max_length=50, blank=False)
    last_name = models.CharField(max_length=50, blank=False)
    birthday = models.DateField(auto_now=False, auto_now_add=False)
    phone_number = models.PositiveIntegerField(min_length=11, max_length=11, blank=False)
    email = models.EmailField(blank=True)
    social_id = models.PositiveIntegerField(min_length=10, max_length=10, blank=False)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.first_name + self.last_name
    