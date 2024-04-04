import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change/models/user_details.dart';

class UserData {
  const UserData({required this.users});

  final List<UserDetails> users;

  UserData getState(List<UserDetails> users) => UserData(users: users);
}

final userProvider = StateNotifierProvider<UserNotitifier, UserData>(
  (ref) => UserNotitifier(),
);

class UserNotitifier extends StateNotifier<UserData> {
  UserNotitifier()
      : super(
          UserData(
            users: [
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
            ],
          ),
        );

  void addUser(UserDetails userDetails) {
    state.users.insert(0, userDetails);
    state = state.getState(state.users);
  }

  void deleteUser(int index) {
    state.users.removeAt(index);
    state = state.getState(state.users);
  }

  void updateUser(int index, String name, String phoneNumber, String address,
      String email) {
    state.users[index].name = name;
    state.users[index].email = email;
    state.users[index].phoneNumber = phoneNumber;
    state.users[index].address = address;
    state = state.getState(state.users);
  }

  UserDetails getUser(int index) => state.users[index];

  List<UserDetails> get users => state.users;
}
