import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magical_change/models/user_details.dart';
import 'package:magical_change/widgets/user_input_form.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({required this.userDetails, super.key});

  final UserDetails userDetails;

  @override
  State<StatefulWidget> createState() {
    return UpdateProfileState();
  }
}

class UpdateProfileState extends State<UpdateProfile> {
  late TextEditingController _name;
  late TextEditingController _email;
  late TextEditingController _phoneNumber;
  late TextEditingController _address;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.userDetails.name);
    _email = TextEditingController(text: widget.userDetails.email);
    _phoneNumber = TextEditingController(text: widget.userDetails.phoneNumber);
    _address = TextEditingController(text: widget.userDetails.address);
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 233, 233),
        title: const Text("Magical Change"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              UserDetailsForm(
                name: _name,
                address: _address,
                email: _email,
                phoneNumber: _phoneNumber,
                userAvatar: widget.userDetails.avatar,
                title: "Update Profile",
              ),
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
                          widget.userDetails.name = _name.text;
                          widget.userDetails.email = _email.text;
                          widget.userDetails.phoneNumber = _phoneNumber.text;
                          Navigator.pop(context, widget.userDetails);
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
