import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magical_change/data/models/user_data_model.dart';
import 'package:magical_change/domain/bloc/user_bloc.dart';
import 'package:magical_change/presentation/widgets/user_input_form.dart';

class AddNewUser extends StatelessWidget {
  AddNewUser({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) => current is UserActionState,
      buildWhen: (previous, current) => current is! UserActionState,
      listener: (context, state) {
        if (state is NavigateToHomePageState) {
          Navigator.pop(context);
        } else if (state is FormSaveSuccessfulState) {
          UserDataModel newUser = UserDataModel(
            name: _name.text,
            email: _email.text,
            phoneNumber: _phoneNumber.text,
            address: _address.text,
            avatar: 'assets/images/avatar5.png',
          );

          userBloc.add(
            AddNewUserEvent(newUser: newUser),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Added Successfully!'),
            ),
          );
        } else if (state is FormSaveFailureState) {
          userBloc.add(FormValidationFailedEvent());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not added!'),
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
            body: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    UserInputForm(
                      name: _name,
                      address: _address,
                      email: _email,
                      phoneNumber: _phoneNumber,
                      userAvatar: const AssetImage('assets/images/avatar5.png'),
                      title: "New User",
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ElevatedButton(
                          onPressed: () {
                            userBloc.add(
                              OnSaveButtonClickedForAddNewUserEvent(
                                formState: _formKey.currentState!.validate(),
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
