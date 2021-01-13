from django.urls import path
from .views import (
    test_api,

    user_registration_view,
    doctor_registration_view,
    patient_registration_view,

    ChangePasswordView,

    # user_update_view,
    doctor_update_view,
    patient_update_view,

    ApiDoctorListView,
    doctor_profile_view,

    add_visit_view,

    get_visits_from_now_for_patient,
    get_visits_from_now_for_doctor,

    CustomAuthToken,

    add_visit_count_for_day,
    get_plan_of_doctor_for_year,
)

from rest_framework.authtoken.views import obtain_auth_token

app_name = 'api'

urlpatterns = [
    path('test/', test_api, name='test-api'),

    path('login2', obtain_auth_token, name='login2'),
    path('login', CustomAuthToken.as_view(), name='login'),
    path('change-password', ChangePasswordView.as_view(), name='change-password'),

    path('register/user', user_registration_view, name='register-user'),
    path('register/doctor', doctor_registration_view, name='register-doctor'),
    path('register/patient', patient_registration_view, name='register-patient'),

    # path('update/user', user_update_view, name='update-user'),
    path('update/doctor', doctor_update_view, name='update-doctor'),
    path('update/patient', patient_update_view, name='update-patient'),

    path('list/doctors/', ApiDoctorListView.as_view(), name='doctors'),

    path('profile/doctor/<int:pk>/', doctor_profile_view, name='doctor-profile'),

    path('visit/add/<int:doctor_pk>', add_visit_view, name='add-visit'),

    path('patient/visits/', get_visits_from_now_for_patient, name='get-visits-patient'),
    path('doctor/visits/', get_visits_from_now_for_doctor, name='get-visits-doctor'),

    path('doctor/plan/day/add', add_visit_count_for_day, name='add-visit-count'),
    path('doctor/plan/<int:doctor_pk>/<year>', get_plan_of_doctor_for_year, name='add-visit-count'),
]
