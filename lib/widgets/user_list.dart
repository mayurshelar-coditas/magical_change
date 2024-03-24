import 'package:flutter/material.dart';
import 'package:magical_change/models/user_details.dart';
import 'package:magical_change/screens/update_profile.dart';
import 'package:magical_change/widgets/users_list_item_widget.dart';

class UserList extends StatefulWidget {
  const UserList({required this.users, super.key});

  final List<UserDetails> users;

  @override
  State<UserList> createState() {
    return _UserListState();
  }
}

class _UserListState extends State<UserList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateProfile(
                  userDetails: widget.users[index],
                ),
              ),
            ).then(
              (updatedUserDetails) {
                if (updatedUserDetails != null) {
                  setState(
                    () {},
                  );
                }
              },
            );
          },
          onLongPress: () {
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
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(
                          () {
                            widget.users.remove(widget.users[index]);
                          },
                        );
                      },
                      child: const Text("Delete"),
                    ),
                  ],
                );
              },
            );
          },
          child: UserListItemWidget(
            userDetails: widget.users[index],
          ),
        );
      },
    );
  }
}
