import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInputForm extends StatelessWidget {
  const UserInputForm(
      {required this.name,
      required this.address,
      required this.email,
      required this.phoneNumber,
      required this.userAvatar,
      required this.title,
      super.key});

  final TextEditingController name, email, address, phoneNumber;
  final AssetImage userAvatar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.sansita(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90.r),
                ),
                child: CircleAvatar(
                  radius: 90.r,
                  backgroundImage: userAvatar,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          color: Colors.white,
          elevation: 5,
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 10.h),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          color: Colors.white,
          elevation: 5,
          child: TextFormField(
            controller: phoneNumber,
            decoration: InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty || value.length != 10) {
                return 'Please enter valid Phone Number';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 20.h),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          color: Colors.white,
          elevation: 5,
          child: TextFormField(
            controller: address,
            decoration: InputDecoration(
              labelText: "Address",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Address';
              }
              return null;
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          color: Colors.white,
          elevation: 5,
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains("@")) {
                return 'Please enter your Email Id';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}