import 'package:flutter/material.dart';
import 'package:magical_change/models/user_details.dart';

class UserDataProvider extends ChangeNotifier {
  //List of users.
  final List<UserDetails> _users = [
    UserDetails(
      name: "Mayur Shelar",
      email: "mayur.shelar@coditas.com",
      phoneNumber: "9359848448",
      address: "Pune, India",
      avatar: const AssetImage(
        'assets/images/avatar6.png',
      ),
    ),
    UserDetails(
      name: "Aditya Zanzane",
      email: "aditya.zanzane@coditas.com",
      phoneNumber: "9533564523",
      address: "Pune, India",
      avatar: const AssetImage(
        'assets/images/avatar3.png',
      ),
    ),
    UserDetails(
      name: "Siddhant Nilage",
      email: "siddhant.nilage@coditas.com",
      phoneNumber: "9574356845",
      address: "Parbhani, India",
      avatar: const AssetImage(
        'assets/images/avatar4.png',
      ),
    ),
    UserDetails(
      name: "Yash Wadadkar",
      email: "yash.wadadkar@coditas.com",
      phoneNumber: "9389425752",
      address: "Wardha, India",
      avatar: const AssetImage(
        'assets/images/avatar5.png',
      ),
    ),
    UserDetails(
      name: "Gaurav Wani",
      email: "gaurav.wani@coditas.com",
      phoneNumber: "7475647548",
      address: "Jalgoan, India",
      avatar: const AssetImage(
        'assets/images/avatar2.png',
      ),
    ),
  ];

  //Getter to get list of users
  List<UserDetails> get users => _users;

  void addUser(UserDetails userDetails) {
    _users.insert(0, userDetails);
    notifyListeners();
  }

  void deleteUser(int index) {
    if (index >= 0 && index < _users.length) {
      _users.removeAt(index);
      notifyListeners();
    }
  }

  void updateUser(int index, String name, String phoneNumber, String address,
      String email) {
    users[index].name = name;
    users[index].email = email;
    users[index].phoneNumber = phoneNumber;
    users[index].address = address;
    notifyListeners();
  }
}
