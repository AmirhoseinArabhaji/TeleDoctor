from django.urls import path
from .views import (
    test_api,
    registration_view,
    doctor_detail, 
    patient_detail,

)


app_name = 'api'

urlpatterns = [
    path('test/', test_api, name='test-api'),
    path('register', registration_view, name='register'),
    path('doctor/<str:email>/', doctor_detail, name='doctor-datail'),
    path('patient/<str:email>', patient_detail, name='patient-datail'),
]
