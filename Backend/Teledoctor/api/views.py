from django.shortcuts import render

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
# from rest_framework.authentication import TokenAuthentication # TODO for class based view
# from rest_framework.pagination import PageNumberPagination # TODO for pagination
# from rest_framework.generics import ListAPIView # TODO for pagination
from rest_framework.authtoken.models import Token

from users.models import User
from doctor.models import Doctor
from patient.models import Patient

from .serializers import (
    UserRegisterSerializer,
    DoctorRegisterSerializer,
    PatientRegisterSerializer,
)


@api_view(['GET', ])
@permission_classes(())
def test_api(request):
    if request.method == 'GET':
        data = {}
        data['response'] = 'Hello World!'
        return Response(data=data)


@api_view(['POST', ])
@permission_classes(())
def user_registration_view(request):

    if request.method == 'POST':
        serializer = UserRegisterSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            user = serializer.save()
            data['response'] = 'successfully registered.'
            token = Token.objects.get(user=user).key
            data['token'] = token
        else:
            data = serializer.errors
        return Response(data)

@api_view(['POST', ])
@permission_classes(())
def doctor_registration_view(request):
    if request.method == 'POST':
        serializer = DoctorRegisterSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            doctor = serializer.save()
            data['response'] = 'successfully registered.'
            token = Token.objects.get(user=doctor.user).key
            data['token'] = token
        else:
            data = serializer.errors
        return Response(data)


@api_view(['POST', ])
@permission_classes(())
def patient_registration_view(request):
    if request.method == 'POST':
        serializer = PatientRegisterSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            patient = serializer.save()
            data['response'] = 'successfully registered.'
            token = Token.objects.get(user=patient.user).key
            data['token'] = token
        else:
            data = serializer.errors
        return Response(data)



# @api_view(['GET', ])
# @permission_classes(())
# def doctor_detail(request, email):
#     try:
#         doctor = Doctor.objects.get(user__email=email)
#     except Doctor.DoesNotExist:
#         return Response(status=status.HTTP_404_NOT_FOUND)

#     # user = request.user
#     # if doctor.user != user:
#     #     return Response({'response': 'You dont have permission to do that.'})

#     if request.method == 'GET':
#         serializer = DoctorRegisterSerializer(doctor)
#         return Response(serializer.data)


# @api_view(['GET', ])
# def patient_detail(request, email):
#     try:
#         patient = Patient.objects.get(user__email=email)
#     except Patient.DoesNotExist:
#         return Response(status=status.HTTP_404_NOT_FOUND)

#     if request.method == 'GET':
#         serializer = PatientRegisterSerializer(patient)
#         return Response(serializer.data)

