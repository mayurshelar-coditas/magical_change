import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserDetails {
  UserDetails(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.avatar});

  String name, email, phoneNumber, address;
  AssetImage avatar;
}
