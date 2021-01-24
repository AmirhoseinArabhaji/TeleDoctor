import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/subjects/subject.dart';

class PatientHandler implements ISubject {
  Patient _patient;
  List<IObserver> _observers;

  PatientHandler(Patient patient)
      : this._patient = patient,
        this._observers = [];

  void changePatient(Patient patient) {
    this._patient = patient;
    notifyObservers();
  }

  Patient get patient => this._patient;

  @override
  void notifyObservers() {
    for (IObserver observer in _observers) observer.update(_patient);
  }

  @override
  void registerObserver(IObserver o) {
    _observers.add(o);
    notifyObservers();
  }

  @override
  void removeObserver(IObserver o) {
    _observers.remove(o);
    notifyObservers();
  }
}
