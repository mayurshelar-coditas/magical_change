import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magical_change/models/user_details.dart';
import 'package:magical_change/screens/add_new_user.dart';
import 'package:magical_change/widgets/user_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<UserDetails> users = [
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

  void addUser(UserDetails userDetails) {
    users.insert(0, userDetails);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 233, 233),
        title: const Text("Magical Change"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewUser(addUser),
                ),
              );
            },
            icon: const Icon(Icons.person_add_alt_1_sharp),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(60.w, 20.h, 60.w, 50.h),
        child: UserList(users: users),
      ),
    );
  }
}
