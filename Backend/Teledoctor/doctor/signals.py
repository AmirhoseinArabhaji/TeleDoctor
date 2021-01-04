from .models import Doctor, Plan
from django.db.models.signals import post_save
from django.dispatch import receiver


@receiver(post_save, sender=Doctor)
def create_plan(sender, instance=None, created=False, **kwargs):
    if created:
        Plan.objects.create(doctor=instance)
