import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:magical_change/domain/bloc/user_bloc.dart';
import 'package:magical_change/presentation/screens/add_new_user.dart';
import 'package:magical_change/presentation/screens/edit_user_details.dart';
import 'package:magical_change/presentation/widgets/user_list_item_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    userBloc.loadUserData();

    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) => current is UserActionState,
      buildWhen: (previous, current) => current is! UserActionState,
      listener: (context, state) {
        if (state is HomeNavigateToAddUserPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewUser(),
            ),
          );
        } else if (state is HomeNavigateToEditUserDetailsPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditUserDetails(
                  user: state.clickedUser,
                  userIndex: state.clickedUserCardIndex),
            ),
          );
        } else if (state is HomeShowDialogBoxToDeleteUserState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm Delete"),
                content:
                    const Text("Are you sure you want to delete this user?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      userBloc.add(
                        OnCancelButtonClickedForDeleteDialogEvent(),
                      );
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      userBloc.add(
                        OnDeleteButtonClickedEvent(index: state.index),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text("Delete"),
                  ),
                ],
              );
            },
          );
        } else if (state is DeleteDialogBoxNavigateToHomeState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is UserListLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is UserListLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Magical Change'),
              actions: [
                IconButton(
                  onPressed: () {
                    userBloc.add(HomeAddNewUserButtonClickedNavigateEvent());
                  },
                  icon: const Icon(Icons.person_add_alt_1_sharp),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(60.w, 20.h, 60.w, 50.h),
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      userBloc.add(
                        HomeUserCardClickedNavigateEvent(
                            clickedUserCard: state.users[index],
                            userCardIndex: index),
                      );
                    },
                    onLongPress: () {
                      userBloc.add(
                        HomeUserCardLongPressedEvent(cardClickedIndex: index),
                      );
                    },
                    child: UserListItemWidget(
                      userDetails: userBloc.users[index],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is UserListErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Error Loading data'),
            ),
          );
        } else {
          return const Scaffold(
            body: SizedBox(),
          );
        }
      },
    );
  }
}
