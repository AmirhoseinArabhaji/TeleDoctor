import 'package:flutter/cupertino.dart';

class Device {
  double width;
  double height;

  Device(Size size) {
    this.width = size.width;
    this.height = size.height;
  }
}

Device device;
