from .models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.conf import settings
from rest_framework.authtoken.models import Token


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    print('fuckin test')
    print('sender', sender)
    print('instance', instance)
    print('created', created)
    
    if created:
        Token.objects.create(user=instance)