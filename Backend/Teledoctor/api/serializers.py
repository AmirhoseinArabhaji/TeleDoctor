from django.contrib.auth import password_validation

from rest_framework import serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
from drf_writable_nested.mixins import NestedCreateMixin, NestedUpdateMixin, UniqueFieldsMixin

from users.models import User
from doctor.models import Doctor
from patient.models import Patient, Visit


class UserRegisterSerializer(serializers.ModelSerializer):

    # password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = User
        # fields = ['email', 'first_name', 'last_name', 'phone_number', 'social_id', 'password', 'password2', 'gender']
        fields = ['email', 'password']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):
        user = User(
            email=self.validated_data['email'],
            # first_name=self.validated_data['first_name'],
            # last_name=self.validated_data['last_name'],
            # phone_number=self.validated_data['phone_number'],
            # social_id=self.validated_data['social_id'],
            # gender=self.validated_data['gender']
        )
        password = self.validated_data['password']
        # password2 = self.validated_data['password2']

        # if password != password2:
            # raise serializers.ValidationError({'password': 'Passwords do not match.'})

        user.set_password(password)
        user.save()
        return user

class DoctorRegisterSerializer(serializers.ModelSerializer):

    user = UserRegisterSerializer()

    class Meta:
        model = Doctor
        # fields = ['user', 'mc_code', ]
        fields = ['user',]


    def create(self, validated_data):

        user_data = validated_data.pop('user')        
        user_ser = UserRegisterSerializer(data=user_data)
        if user_ser.is_valid():
            user = user_ser.save()
        else:
            raise serializers.ValidationError(user_ser.errors)
        doctor = Doctor(
            user=user,
            # mc_code=self.validated_data['mc_code']
            )
        doctor.save()

        return doctor

class PatientRegisterSerializer(serializers.ModelSerializer):
    
    user = UserRegisterSerializer()

    class Meta:
        model = Patient
        fields = ['user', ]

    
    def create(self, validated_data):

        user_data = validated_data.pop('user')        
        user_ser = UserRegisterSerializer(data=user_data)
        if user_ser.is_valid():
            user = user_ser.save()
        else:
            raise serializers.ValidationError(user_ser.errors)
        patient = Patient(
            user=user,
            # set other fields here
            )
        patient.save()

        return patient

class ChangePasswordSerializer(serializers.ModelSerializer):
    
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)
    new_password2 = serializers.CharField(required=True)

    class Meta:
        model = User
        fields = ['old_password', 'new_password', 'new_password2']


class UserUpdateSerializer(UniqueFieldsMixin, NestedUpdateMixin, serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'gender', 'phone_number', 'social_id', 'gender', ]


class DoctorUpdateSerializer(UniqueFieldsMixin, NestedUpdateMixin, serializers.ModelSerializer):

    user = UserUpdateSerializer()

    class Meta:
        model = Doctor
        fields = ['id', 'user', 'mc_code', ]


class PatientUpdateSerializer(UniqueFieldsMixin, NestedUpdateMixin, serializers.ModelSerializer):

    user = UserUpdateSerializer()
    
    class Meta:
        model = Patient
        fields = ['id', 'user', ]



class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = '__all__'

class DoctorSerializer(serializers.ModelSerializer):
    
    user = UserSerializer()

    class Meta:
        model = Doctor
        fields = '__all__'

class PatientSerializer(serializers.ModelSerializer):

    user = UserSerializer()

    class Meta:
        model = Patient
        fields = '__all__'

class VisitSerializer(serializers.ModelSerializer):

    patient = serializers.ReadOnlyField()
    doctor = serializers.ReadOnlyField()
    
    class Meta:
        model = Visit
        fields = '__all__'

