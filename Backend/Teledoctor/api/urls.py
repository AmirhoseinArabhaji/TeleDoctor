from django.urls import path
from .views import (
    test_api,
    user_registration_view,
    doctor_registration_view,
    patient_registration_view,
    ChangePasswordView,
    user_update_view,
    # doctor_detail, 
    # patient_detail,
)

from rest_framework.authtoken.views import obtain_auth_token


app_name = 'api'

urlpatterns = [
    path('test/', test_api, name='test-api'),

    path('login', obtain_auth_token, name='login'),
    path('change-password', ChangePasswordView.as_view(), name='change-password'),

    path('register/user', user_registration_view, name='register-user'),
    path('register/doctor', doctor_registration_view, name='register-doctor'),
    path('register/patient', patient_registration_view, name='register-patient'),

    path('update/user', user_update_view, name='update-user')
    # path('doctor/<str:email>', doctor_detail, name='doctor-detail'),
    # path('patient/<str:email>', patient_detail, name='patient-datail'),
]
