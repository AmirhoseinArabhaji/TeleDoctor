from rest_framework import serializers

from users.models import User
from doctor.models import Doctor
from patient.models import Patient


class RegistrationSerializer(serializers.ModelSerializer):

    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = User
        fields = ['email', 'first_name', 'last_name', 'phone_number', 'social_id', 'password', 'password2']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def save(self):
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
        user.save() # because we overwrited save method
        return user


class DoctorSerializer(serializers.ModelSerializer):

    email = serializers.EmailField(source='user.email')
    first_name = serializers.CharField(source='user.first_name')
    last_name = serializers.SerializerMethodField('get_last_name_from_user') # both methods work which one to use TODO ??

    class Meta:
        model = Doctor
        fields = ['user', 'mc_code', 'email', 'first_name', 'last_name']

    def get_last_name_from_user(self, doctor):
        last_name = doctor.user.last_name
        return last_name

        
class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient
        fields = ['user',]