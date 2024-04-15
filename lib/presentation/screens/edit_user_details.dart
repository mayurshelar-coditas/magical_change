import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magical_change/data/models/user_data_model.dart';
import 'package:magical_change/domain/bloc/user_bloc.dart';
import 'package:magical_change/presentation/widgets/user_input_form.dart';

class EditUserDetails extends StatelessWidget {
  const EditUserDetails(
      {required this.userIndex, required this.user, super.key});
  final UserDataModel user;
  final int userIndex;

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    TextEditingController name = TextEditingController(text: user.name);
    TextEditingController email = TextEditingController(text: user.email);
    TextEditingController phoneNumber =
        TextEditingController(text: user.phoneNumber);
    TextEditingController address = TextEditingController(text: user.address);

    final formKey = GlobalKey<FormState>();

    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) => current is UserActionState,
      buildWhen: (previous, current) => current is! UserActionState,
      listener: (context, state) {
        if (state is NavigateToHomePageState) {
          Navigator.pop(context);
        } else if (state is FormSaveSuccessfulState) {
          UserDataModel updatedDetails = UserDataModel(
            name: name.text,
            email: email.text,
            phoneNumber: phoneNumber.text,
            address: address.text,
            avatar: user.avatar,
          );
          userBloc.add(
            EditUserDetailsEvent(
                updatedUserDetails: updatedDetails, userCardIndex: userIndex),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Details Updated Successfully!'),
            ),
          );
        } else if (state is FormSaveFailureState) {
          userBloc.add(FormValidationFailedEvent());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong!'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FormLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
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
                    UserInputForm(
                      name: name,
                      address: address,
                      email: email,
                      phoneNumber: phoneNumber,
                      userAvatar: AssetImage(user.avatar),
                      title: "Update Profile",
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              userBloc.add(OnCancelButtonClickedEvent());
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
                              userBloc.add(
                                OnSaveButtonClickedForEditUserEvent(
                                  formState: formKey.currentState!.validate(),
                                ),
                              );
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
      },
    );
  }
}
