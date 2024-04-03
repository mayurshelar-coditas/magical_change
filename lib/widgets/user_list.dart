import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change/providers/user_data_provider.dart';
import 'package:magical_change/screens/update_profile.dart';
import 'package:magical_change/widgets/users_list_item_widget.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider).users;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateProfile(index: index),
              ),
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
                        ref.read(userProvider.notifier).deleteUser(index);
                      },
                      child: const Text("Delete"),
                    ),
                  ],
                );
              },
            );
          },
          child: UserListItemWidget(
            userDetails: users[index],
          ),
        );
      },
    );
  }
}
