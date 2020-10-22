from django.shortcuts import render

from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.generics import UpdateAPIView, ListAPIView
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
# from rest_framework.authentication import TokenAuthentication # TODO for class based view
# from rest_framework.pagination import PageNumberPagination # TODO for pagination
# from rest_framework.generics import ListAPIView # TODO for pagination
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework.pagination import PageNumberPagination
from rest_framework.filters import SearchFilter, OrderingFilter

from users.models import User
from doctor.models import Doctor
from patient.models import Patient

from .serializers import (
    UserRegisterSerializer,
    DoctorRegisterSerializer,
    PatientRegisterSerializer,

    ChangePasswordSerializer,

    UserUpdateSerializer,
    DoctorUpdateSerializer,
    PatientUpdateSerializer,

    UserSerializer,
    DoctorSerializer,
    PatientSerializer,

    VisitSerializer,
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


class ChangePasswordView(generics.UpdateAPIView):
    serializer_class = ChangePasswordSerializer
    model = User
    permission_classes = (IsAuthenticated,)

    def get_object(self, queryset=None):
        obj = self.request.user
        return obj

    def update(self, request, *args, **kwargs):
        self.object = self.get_object()
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            # Check old password
            if not self.object.check_password(serializer.data.get('old_password')):
                return Response({'message': 'Wrong password.'}, status=status.HTTP_400_BAD_REQUEST)
            if serializer.data.get('new_password') != serializer.data.get('new_password2'):
                return Response({'message': 'Passwords do not match.'})
            # set_password also hashes the password that the user will get
            self.object.set_password(serializer.data.get('new_password'))
            self.object.save()
            response = {
                'status': 'success',
                'message': 'Password updated successfully',
            }
            return Response(response)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['PUT', ])
@permission_classes((IsAuthenticated, ))
def user_update_view(request):
    if request.method == 'PUT':
        serializer = UserUpdateSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            Patient = serializer.save()
            data['response'] = 'successfully updated'
        else:
            data = serializer.errors
        return Response(data)



class ApiDoctorListView(ListAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    pagination_class = PageNumberPagination
    filter_backends = (SearchFilter, OrderingFilter)
    search_fields = ('user__first_name', 'user__last_name', )


@api_view(['GET', ])
@permission_classes((IsAuthenticated, ))
def doctor_profile_view(request, pk):
    
    try:
        doctor = Doctor.objects.get(pk=pk)
    except Doctor.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = DoctorSerializer(doctor)
        return Response(serializer.data)


@api_view(['POST', ])
@permission_classes((IsAuthenticated, ))
def add_visit_view(request, doctor_pk):
    try:
        patient = Token.objects.get(key=request.auth.key).user.patient
        doctor = Doctor.objects.get(pk=doctor_pk)
    except Patient.DoesNotExist:
        return Response(data={'error': 'patient does not exist.'}, status=status.HTTP_404_NOT_FOUND)
    except Doctor.DoesNotExist:
        return Response(data={'error': 'doctor does not exist.'}, status=status.HTTP_404_NOT_FOUND)

    # user = request.user
    # if patient != user:
    #     return Response({'error': 'user and patient do not match'}, status=status.HTTP_400_BAD_REQUEST)

    context = {
        'doctor': doctor,
        'patient': patient
    }
    serializer = VisitSerializer(data=request.data, context=context)
    data = {}
    if serializer.is_valid():
        patient = serializer.save(doctor=doctor, patient=patient)
        data['message'] = 'visit added successfully'
    else:
        data = serializer.errors

    return Response(data)


@api_view(['PUT', ])
@permission_classes((IsAuthenticated, ))
def doctor_update_view(request):

    doctor = Token.objects.get(key=request.auth.key).user.doctor
    if request.method == 'PUT':
        serializer = DoctorUpdateSerializer(data=request.data, instance=doctor)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['response'] = 'update successfull.'
        else:
            data = serializer.errors
        return Response(data=data, status=status.HTTP_200_OK)


@api_view(['PUT', ])
@permission_classes((IsAuthenticated, ))
def patient_update_view(request):
    patient = Token.objects.get(key=request.auth.key).user.patient
    if request.method == 'PUT':
        serializer = PatientUpdateSerializer(data=request.data, instance=patient)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['response'] = 'update successfull.'
        else:
            data = serializer.errors
        return Response(data=data, status=status.HTTP_200_OK)


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

