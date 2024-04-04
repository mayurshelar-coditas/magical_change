import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magical_change/providers/user_data_provider.dart';
import 'package:magical_change/widgets/user_input_form.dart';

class UpdateProfile extends ConsumerWidget {
  const UpdateProfile({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider.notifier).getUser(index);

    TextEditingController name = TextEditingController(text: user.name);
    TextEditingController email = TextEditingController(text: user.email);
    TextEditingController phoneNumber =
        TextEditingController(text: user.phoneNumber);
    TextEditingController address = TextEditingController(text: user.address);

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 233, 233),
        title: const Text("Magical Change"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              UserDetailsForm(
                name: name,
                address: address,
                email: email,
                phoneNumber: phoneNumber,
                userAvatar: user.avatar,
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
                        if (formKey.currentState!.validate()) {
                          ref.read(userProvider.notifier).updateUser(
                              index,
                              name.text,
                              phoneNumber.text,
                              address.text,
                              email.text);
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
