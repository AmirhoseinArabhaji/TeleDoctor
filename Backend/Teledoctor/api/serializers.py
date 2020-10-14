from rest_framework import serializers

from users.models import User
from doctor.models import Doctor
from patient.models import Patient


class UserRegisterSerializer(serializers.ModelSerializer):

    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = User
        fields = '__all__'
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
            gender=self.validated_data['gender']
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']

        if password != password2:
            raise serializers.ValidationError({'password': 'Passwords do not match.'})

        user.set_password(password)
        user.save()
        return user


class DoctorRegisterSerializer(serializers.ModelSerializer):

    user = UserRegisterSerializer()

    class Meta:
        model = Doctor
        fields = '__all__'


    def create(self, validated_data):

        user_data = validated_data.pop('user')        
        user_ser = UserRegisterSerializer(data=user_data)
        if user_ser.is_valid():
            user = user_ser.save()
        else:
            raise serializers.ValidationError(user_ser.errors)
        doctor = Doctor(
            user=user,
            mc_code=self.validated_data['mc_code']
            )
        doctor.save()

        return doctor

class PatientRegisterSerializer(serializers.ModelSerializer):
    
    user = UserRegisterSerializer()

    class Meta:
        model = Patient
        fields = []

    
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

