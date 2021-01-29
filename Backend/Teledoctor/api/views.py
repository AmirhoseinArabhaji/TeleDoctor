from django.shortcuts import render

from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.generics import UpdateAPIView, ListAPIView, CreateAPIView, get_object_or_404
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework.pagination import PageNumberPagination
from rest_framework.filters import SearchFilter, OrderingFilter
from datetime import datetime

from users.models import User
from doctor.models import Doctor, Plan, Day
from patient.models import Patient, Visit

from datetime import datetime

from .serializers import (
    UserRegisterSerializer,
    DoctorRegisterSerializer,
    PatientRegisterSerializer,

    ChangePasswordSerializer,

    UserUpdateSerializer,
    DoctorUpdateSerializer,
    PatientUpdateSerializer,

    DoctorListSerializer,

    DoctorProfileSerializer,

    VisitSerializer,
    PatientVisitSerializer,

    DaySerializer,
    VisitListSerializer,
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
            data.update(serializer.data)
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
            data.update(serializer.data)
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
            data.update(serializer.data)
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


class ApiDoctorListView(ListAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorListSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    pagination_class = PageNumberPagination
    filter_backends = (SearchFilter, OrderingFilter)
    search_fields = ('user__first_name', 'user__last_name', 'specialty',)


@api_view(['GET', ])
@permission_classes((IsAuthenticated,))
def doctor_profile_view(request, pk):
    try:
        doctor = Doctor.objects.get(pk=pk)
    except Doctor.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = DoctorProfileSerializer(doctor)
        return Response(serializer.data)


# @api_view(['PUT', ])
# @permission_classes((IsAuthenticated,))
# def user_update_view(request):
#     if request.method == 'PUT':
#         serializer = UserUpdateSerializer(data=request.data)
#         data = {}
#         if serializer.is_valid():
#             Patient = serializer.save()
#             data['response'] = 'successfully updated'
#         else:
#             data = serializer.errors
#         return Response(data)


@api_view(['PUT', ])
@permission_classes((IsAuthenticated,))
def doctor_update_view(request):
    doctor = Token.objects.get(key=request.auth.key).user.doctor
    if request.method == 'PUT':
        serializer = DoctorUpdateSerializer(data=request.data, instance=doctor, partial=True)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['response'] = 'update successful.'
        else:
            data = serializer.errors
        return Response(data=data, status=status.HTTP_200_OK)


@api_view(['PUT', ])
@permission_classes((IsAuthenticated,))
def patient_update_view(request):
    patient = Token.objects.get(key=request.auth.key).user.patient
    if request.method == 'PUT':
        serializer = PatientUpdateSerializer(data=request.data, instance=patient, partial=True)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['response'] = 'update successful.'
        else:
            data = serializer.errors
        return Response(data=data, status=status.HTTP_200_OK)


@api_view(['GET', ])
@permission_classes((IsAuthenticated,))
def get_visits_from_now_for_patient(request):
    patient_pk = Token.objects.get(key=request.auth.key).user.patient.pk
    today = datetime.today()
    visits = Visit.objects.filter(patient__pk=patient_pk).filter(date__gte=today)
    serializer = PatientVisitSerializer(visits, many=True)
    return Response(data=serializer.data)


@api_view(['GET', ])
@permission_classes((IsAuthenticated,))
def get_visits_from_now_for_doctor(request):
    doctor_pk = Token.objects.get(key=request.auth.key).user.doctor.pk
    today = datetime.today()
    visits = Visit.objects.filter(doctor__pk=doctor_pk).filter(date__gte=today)
    serializer = PatientVisitSerializer(visits, many=True)
    return Response(data=serializer.data)


class CustomAuthToken(ObtainAuthToken):
    authentication_classes = []
    permission_classes = []

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        data = {'token': token.key,
                'id': user.id,
                'email': user.email,
                'first_name': user.first_name,
                'last_name': user.last_name,
                'phone_number': user.phone_number,
                'profile_pic': user.profile_pic.url,
                'gender': user.gender,
                'social_id': user.social_id,
                'date_of_birth': user.date_of_birth,
                }

        if hasattr(user, 'patient'):
            patient = {'patient': {
                'id': user.patient.id,
                'insurance_id': user.patient.insurance_id,
                'insurance_organ': user.patient.insurance_organ,
                'booklet_expire_date': user.patient.booklet_expire_date,
                'booklet_code': user.patient.booklet_code
            }
            }
            data.update(patient)

        if hasattr(user, 'doctor'):
            doctor = {'doctor': {
                'id': user.doctor.id,
                'mc_code': user.doctor.mc_code,
                'specialty': user.doctor.specialty,
                'about_me': user.doctor.about_me,
                'location': user.doctor.location,
            }
            }
            data.update(doctor)

        return Response(data=data)


@api_view(['POST', ])
@permission_classes((IsAuthenticated,))
def add_visit_count_for_day_view(request):
    doctor = Token.objects.get(key=request.auth.key).user.doctor
    plan = Plan.objects.get(doctor=doctor)

    day = Day(plan=plan)

    if request.method == 'POST':
        serializer = DaySerializer(day, data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['response'] = 'successfully added.'
            data.update(serializer.data)
        else:
            data = serializer.errors
        return Response(data)


@api_view(['GET', ])
@permission_classes((IsAuthenticated,))
def get_plan_of_doctor_for_year_view(request, doctor_pk, year):
    doctor = Doctor.objects.get(pk=doctor_pk)
    plan = Plan.objects.get(doctor=doctor)

    days = Day.objects.filter(date__year=year, plan=plan).order_by('date')

    serializer = DaySerializer(days, many=True)
    return Response(serializer.data)


@api_view(['POST', ])
@permission_classes((IsAuthenticated,))
def add_visit_view(request, doctor_pk):
    try:
        patient = Token.objects.get(key=request.auth.key).user.patient
        doctor = Doctor.objects.get(pk=doctor_pk)
    except Patient.DoesNotExist:
        return Response(data={'error': 'patient does not exist.'}, status=status.HTTP_404_NOT_FOUND)
    except Doctor.DoesNotExist:
        return Response(data={'error': 'doctor does not exist.'}, status=status.HTTP_404_NOT_FOUND)

    try:
        # get all days of doctor's plan
        days = Day.objects.filter(plan__doctor__pk=doctor_pk)
        day = days.get(date=request.data['date'])
    except Day.DoesNotExist:
        return Response(data={'error': 'no plan for this day found.'})

    # check for available visit for day
    if day.reserved >= day.visit_count:
        return Response(data={'error': 'no available visit for this day'})
    else:
        # increase reserved visits for day
        day.reserved += 1
        day.save()

    visit = Visit(doctor=doctor, patient=patient)
    serializer = VisitSerializer(visit, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    else:
        return Response(serializer.errors)


@api_view(['GET', ])
@permission_classes((IsAuthenticated,))
def get_doctor_visit_list(request, date):
    doctor = Token.objects.get(key=request.auth.key).user.doctor
    visits = Visit.objects.filter(doctor=doctor).filter(date=date)
    serializer = VisitListSerializer(visits, many=True)
    if not visits.exists():
        return Response({'response': 'no visit found'})
    else:
        return Response(serializer.data)


@api_view(['GET', ])
@permission_classes((IsAuthenticated,))
def get_doctor_today_visit_list(request):
    doctor = Token.objects.get(key=request.auth.key).user.doctor
    date = datetime.today().strftime('%Y-%m-%d')
    visits = Visit.objects.filter(doctor=doctor).filter(date=date)
    serializer = VisitListSerializer(visits, many=True)
    if not visits.exists():
        return Response({'response': 'no visit found'})
    else:
        return Response(serializer.data)