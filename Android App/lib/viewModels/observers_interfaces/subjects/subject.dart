import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';

class ISubject {
  void removeObserver(IObserver o){}
  void registerObserver(IObserver o){}
  void notifyObservers(){}
}