from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view

from users.models import User
from doctor.models import Doctor
from patient.models import Patient

from .serializers import (
    RegistrationSerializer,
    DoctorSerializer,
    PatientSerializer,
)

from rest_framework.authtoken.models import Token

@api_view(['GET', ])
def test_api(request):
    if request.method == 'GET':
        data = {}
        data['response'] = 'Hello World!'
        return Response(data=data)


@api_view(['POST', ])
def registration_view(request):

    if request.method == 'POST':
        serializer = RegistrationSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            user = serializer.save()
            data['response'] = 'successfully registered.'
            data['email'] = user.email
            data['first_name'] = user.first_name
            data['last_name'] = user.last_name
            data['phone_number'] = user.phone_number
            data['social_id'] = user.social_id
            token = Token.objects.get(user=user).key
            data['token'] = token
        else:
            data = serializer.errors
        return Response(data)


@api_view(['GET', ])
def doctor_detail(request, email):
    try:
        doctor = Doctor.objects.get(user__email=email)
    except Doctor.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = DoctorSerializer(doctor)
        return Response(serializer.data)


@api_view(['GET', ])
def patient_detail(request, email):
    try:
        patient = Patient.objects.get(user__email=email)
    except Patient.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = PatientSerializer(patient)
        return Response(serializer.data)