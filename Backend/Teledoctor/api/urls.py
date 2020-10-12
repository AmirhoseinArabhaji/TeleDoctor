from django.urls import path
from .views import (
    test_api,
    registration_view,
    doctor_registration_view,
    # doctor_detail, 
    # patient_detail,
)

from rest_framework.authtoken.views import obtain_auth_token


app_name = 'api'

urlpatterns = [
    path('test/', test_api, name='test-api'),
    path('login', obtain_auth_token, name='login'),
    path('register', registration_view, name='register'),
    path('register/doctor', doctor_registration_view, name='register-doctor'),
    # path('doctor/<str:email>/', doctor_detail, name='doctor-datail'),
    # path('patient/<str:email>', patient_detail, name='patient-datail'),
]
