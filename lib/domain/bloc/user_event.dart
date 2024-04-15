// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

sealed class UserEvent {}

class HomeInitialEvent extends UserEvent {}

class HomeUserCardClickedNavigateEvent extends UserEvent {
  final UserDataModel clickedUserCard;
  final int userCardIndex;

  HomeUserCardClickedNavigateEvent(
      {required this.userCardIndex, required this.clickedUserCard});
}

class HomeAddNewUserButtonClickedNavigateEvent extends UserEvent {}

class HomeUserCardLongPressedEvent extends UserEvent {
  final int cardClickedIndex;

  HomeUserCardLongPressedEvent({required this.cardClickedIndex});
}

class OnLoadUserListEvent extends UserEvent {
  List<UserDataModel> users;
  OnLoadUserListEvent({
    required this.users,
  });
}

//Events for Form

class OnSaveButtonClickedForEditUserEvent extends UserEvent {
  bool formState;

  OnSaveButtonClickedForEditUserEvent({
    required this.formState,
  });
}

class OnSaveButtonClickedForAddNewUserEvent extends UserEvent {
  bool formState;

  OnSaveButtonClickedForAddNewUserEvent({
    required this.formState,
  });
}

class OnCancelButtonClickedEvent extends UserEvent {}

//Events for delete dialog box

class OnCancelButtonClickedForDeleteDialogEvent extends UserEvent {}

class OnDeleteButtonClickedEvent extends UserEvent {
  final int index;

  OnDeleteButtonClickedEvent({required this.index});
}

class AddNewUserEvent extends UserEvent {
  UserDataModel newUser;
  AddNewUserEvent({
    required this.newUser,
  });
}

class EditUserDetailsEvent extends UserEvent {
  final UserDataModel updatedUserDetails;
  final int userCardIndex;

  EditUserDetailsEvent(
      {required this.updatedUserDetails, required this.userCardIndex});
}

class FormValidationFailedEvent extends UserEvent {}
