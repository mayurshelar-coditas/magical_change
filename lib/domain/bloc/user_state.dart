part of 'user_bloc.dart';

sealed class UserState {}

final class UserBlocInitial extends UserState {}

sealed class UserActionState extends UserState {}

class UserListLoadingState extends UserState {}

class UserListErrorState extends UserState {}

class UserListLoadedState extends UserState {
  final List<UserDataModel> users;

  UserListLoadedState({required this.users});
}

class HomeNavigateToEditUserDetailsPageActionState extends UserActionState {
  final UserDataModel clickedUser;
  final int clickedUserCardIndex;

  HomeNavigateToEditUserDetailsPageActionState(
      {required this.clickedUserCardIndex, required this.clickedUser});
}

class HomeNavigateToAddUserPageActionState extends UserActionState {}

class HomeSaveUsersUpdatedDetailsState extends UserActionState {}

//states related to User Input Form

class FormLoadingState extends UserState {}

class FormSaveSuccessfulState extends UserActionState {}

class FormSaveFailureState extends UserActionState {}

class FormNavigateToHomePageState extends UserActionState {}

class NavigateToHomePageState extends UserActionState {}

//States related to delete dialog box
class HomeShowDialogBoxToDeleteUserState extends UserActionState {
  final int index;

  HomeShowDialogBoxToDeleteUserState({required this.index});
}

class DeleteDialogBoxNavigateToHomeState extends UserActionState {}
