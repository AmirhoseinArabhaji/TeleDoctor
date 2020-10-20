from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

from django.core.validators import MinLengthValidator


class UserManager(BaseUserManager):
    def create_user(
        self,
        email,
        first_name,
        last_name,
        phone_number,
        social_id,
        gender,
        password=None,
        is_staff=False,
        is_superuser=False,
        is_active=True):

        if not email or not phone_number or not first_name or not last_name or not social_id:
            raise ValueError('fill all the fields')
        if not password:
            raise ValueError('must have pasword')

        user = self.model(
            email = self.normalize_email(email),
            first_name = first_name,
            last_name = last_name,
            phone_number = phone_number,
            social_id = social_id,
            gender = gender,
        )

        user.set_password(password)
        user.is_staff = is_staff
        user.is_superuser = is_superuser
        user.is_active = is_active
        user.save(using=self._db)

        return user


    def create_staffuser(self, email, first_name, last_name ,phone_number, social_id, gender, password=None):
        user = self.create_user(
            email,
            first_name = first_name,
            last_name = last_name,
            phone_number = phone_number,
            social_id = social_id,
            gender=gender,
            password=password,
            is_staff=True,
        )
        return user

    def create_superuser(self, email, first_name, last_name, phone_number, social_id, gender, password=None):
        user = self.create_user(
            email,
            first_name = first_name,
            last_name = last_name,
            phone_number = phone_number,
            social_id = social_id,
            gender = gender,
            password=password,
            is_staff=True,
            is_superuser=True,
        )
        return user


class User(AbstractBaseUser):

    GENDER = [
        ('MALE', 'male'),
        ('FEMALE', 'female'),
    ]

    first_name       = models.CharField(max_length=50, null=True, blank=False)
    last_name        = models.CharField(max_length=50, null=True, blank=False)
    date_of_birth    = models.DateField(auto_now=False, auto_now_add=False, null=True, blank=False)
    email            = models.EmailField(blank=False, null=False, unique=True)
    phone_number     = models.CharField(validators=[MinLengthValidator(11)],max_length=11, unique=True, null=True)
    social_id        = models.CharField(validators=[MinLengthValidator(10)],max_length=10, unique=True, null=True)
    gender           = models.CharField(max_length=6, choices=GENDER, null=True)
    profile_pic      = models.ImageField(default='default.jpg', upload_to='profile_pics')
    date_joined      = models.DateTimeField(auto_now_add=True)
    last_login       = models.DateTimeField(auto_now=True)
    is_active        = models.BooleanField(default=True) # can login
    is_superuser     = models.BooleanField(default=False) # staff user non superuser
    is_staff         = models.BooleanField(default=False) # superuser


    USERNAME_FIELD = 'email'
    # REQUIRED_FIELDS = ['first_name', 'last_name', 'phone_number', 'social_id', 'gender',]

    object = UserManager()

    def __str__(self):
        if self.first_name == None or self.last_name == None or self.social_id == None:
            return 'no detail for user'
        return self.first_name + ' ' + self.last_name + ' ' + self.social_id

    def get_full_name(self):
        if self.first_name == None or self.last_name == None:
            return 'no detail for user'
        return self.first_name + ' ' + self.last_name

    def get_short_name(self):
        if self.last_name == None:
            return 'Unknown'
        return self.last_name

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

