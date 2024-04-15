import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magical_change/data/models/user_data_model.dart';

class UserListItemWidget extends StatelessWidget {
  const UserListItemWidget({required this.userDetails, super.key});

  final UserDataModel userDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.dm,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15.dm),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70.r,
                    backgroundImage: AssetImage(userDetails.avatar),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    textAlign: TextAlign.center,
                    userDetails.name,
                    style: GoogleFonts.sansita(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 20.w),
                Text(
                  "Phone Number: ",
                  style: GoogleFonts.sansita(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  userDetails.phoneNumber,
                  style: GoogleFonts.sansita(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20.w),
                Text(
                  "Address: ",
                  style: GoogleFonts.sansita(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Text(
                    userDetails.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sansita(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20.w),
                Text(
                  "Email Id: ",
                  style: GoogleFonts.sansita(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Text(
                    userDetails.email,
                    style: GoogleFonts.sansita(
                      color: Colors.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
