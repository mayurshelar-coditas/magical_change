import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magical_change/screens/add_new_user.dart';
import 'package:magical_change/widgets/user_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  builder: (context) => AddNewUser(),
                ),
              );
            },
            icon: const Icon(Icons.person_add_alt_1_sharp),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(60.w, 20.h, 60.w, 50.h),
        child: const UserList(),
      ),
    );
  }
}
