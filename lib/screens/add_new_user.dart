import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magical_change/models/user_details.dart';
import 'package:magical_change/widgets/user_input_form.dart';

class AddNewUser extends StatelessWidget {
  AddNewUser(this.onUserAdded, {super.key});

  final void Function(UserDetails newUser) onUserAdded;

  final UserDetails newUser = UserDetails(
    name: "",
    email: "",
    phoneNumber: "",
    address: "",
    avatar: const AssetImage(
      'assets/images/avatar5.png',
    ),
  );

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 233, 233),
        title: const Text("Magical Change"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              UserDetailsFrom(
                name: _name,
                address: _address,
                email: _email,
                phoneNumber: _phoneNumber,
                userAvatar: const AssetImage(
                  'assets/images/avatar5.png',
                ),
                title: "New User",
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.sansita(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          newUser.name = _name.text;
                          newUser.email = _email.text;
                          newUser.phoneNumber = _phoneNumber.text;
                          newUser.address = _address.text;
                          onUserAdded(newUser);
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.sansita(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
