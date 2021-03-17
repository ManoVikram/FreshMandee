import 'package:flutter/widgets.dart';

class PhoneNumber with ChangeNotifier {
  String _phoneNumber;

  String get getPhoneNumber => _phoneNumber;

  set setPhoneNumber(String value) => _phoneNumber = value;
}
