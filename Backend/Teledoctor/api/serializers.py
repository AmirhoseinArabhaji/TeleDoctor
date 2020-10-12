from rest_framework import serializers

from users.models import User
from doctor.models import Doctor
from patient.models import Patient


class UserSerializer(serializers.ModelSerializer):

    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = User
        fields = ['email', 'first_name', 'last_name', 'phone_number', 'social_id', 'password', 'password2']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):
        user = User(
            email=self.validated_data['email'],
            first_name = self.validated_data['first_name'],
            last_name=self.validated_data['last_name'],
            phone_number=self.validated_data['phone_number'],
            social_id=self.validated_data['social_id'],
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']

        if password != password2:
            raise serializers.ValidationError({'password': 'Passwords do not match.'})

        user.set_password(password)
        user.save()
        return user

    
class DoctorSerializer(serializers.ModelSerializer):
    
    user = UserSerializer()

    class Meta:
        model = Doctor
        fields = ['email', 'first_name', 'last_name', 'phone_number', 'social_id', 'password', 'password2', 'mc_code']
        

    def create(self):
        doctor = Doctor(
            user=user,
            mc_code=self.validated_data['mc_code']
        )
        doctor.save()
        return doctor

class PatientSerializer(serializers.ModelSerializer):
    
    user = UserSerializer()

    class Meta:
        model = Patient
        fields = []

