import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:magical_change/data/models/user_data_model.dart';
import 'package:magical_change/data/user_data_source.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final userDataSource = UserDataSource();

  UserBloc() : super(UserBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<UserEvent>((event, emit) {
      //Triggering events for edit User Screen and functionality
      on<OnSaveButtonClickedForEditUserEvent>(
          onSaveButtonClickedForEditUserEvent);

      on<EditUserDetailsEvent>(editUserDetailsEvent);

      on<HomeUserCardClickedNavigateEvent>(homeUserCardClickedNavigateEvent);

      //Triggering events for Add User Screen and functionality
      on<AddNewUserEvent>(addNewUserEvent);

      on<HomeAddNewUserButtonClickedNavigateEvent>(
          homeAddNewUserButtonClickedNavigateEvent);

      on<OnSaveButtonClickedForAddNewUserEvent>(
          onSaveButtonClickedForAddNewUserEvent);

      //Trigerrring events for delete dialog box
      on<OnDeleteButtonClickedEvent>(onDeleteButtonClickedEvent);

      on<OnCancelButtonClickedForDeleteDialogEvent>(
          onCancelButtonClickedForDeleteDialogEvent);

      on<HomeUserCardLongPressedEvent>(homeUserCardLongPressedEvent);

      //Trigerring common events for almost all the screens
      on<FormValidationFailedEvent>(formValidationFailedEvent);

      on<OnCancelButtonClickedEvent>(onCancelButtonClickedEvent);
    });
  }

  //User oject to store data after fetching the data.
  List<UserDataModel> users = [];

  //Intial events to fetch Data as soon as user opens the app
  void loadUserData() {
    add(HomeInitialEvent());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<UserState> emit) async {
    emit(UserListLoadingState());

    try {
      users = await userDataSource.fetchUserData();
      emit(UserListLoadedState(users: users));
    } catch (e) {
      emit(UserListErrorState());
    }
  }

//Functionalty for Adding new user

  void addUser(UserDataModel userDetails) {
    users.insert(0, userDetails);
  }

  FutureOr<void> homeAddNewUserButtonClickedNavigateEvent(
      HomeAddNewUserButtonClickedNavigateEvent event,
      Emitter<UserState> emit) async {
  
    emit(HomeNavigateToAddUserPageActionState());
  }

  FutureOr<void> addNewUserEvent(
      AddNewUserEvent event, Emitter<UserState> emit) {
    addUser(event.newUser);

    emit(
      NavigateToHomePageState(),
    );
    emit(
      UserListLoadedState(users: users),
    );
  }

  FutureOr<void> onSaveButtonClickedForAddNewUserEvent(
      OnSaveButtonClickedForAddNewUserEvent event,
      Emitter<UserState> emit) async {
    emit(FormLoadingState());
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (event.formState) {
      emit(
        FormSaveSuccessfulState(),
      );
    } else {
      emit(
        FormSaveFailureState(),
      );
    }
  }

//Functionality to delete user
  void deleteUser(int index) {
    users.removeAt(index);
  }

  FutureOr<void> homeUserCardLongPressedEvent(
      HomeUserCardLongPressedEvent event, Emitter<UserState> emit) {
    emit(HomeShowDialogBoxToDeleteUserState(index: event.cardClickedIndex));
  }

  FutureOr<void> onCancelButtonClickedForDeleteDialogEvent(
      OnCancelButtonClickedForDeleteDialogEvent event,
      Emitter<UserState> emit) {
    emit(
      DeleteDialogBoxNavigateToHomeState(),
    );
  }

  FutureOr<void> onDeleteButtonClickedEvent(
      OnDeleteButtonClickedEvent event, Emitter<UserState> emit) {
    deleteUser(event.index);

    emit(
      UserListLoadedState(users: users),
    );
  }

  //Functionality for editing user details
  void editUserDetails(int index, UserDataModel updatedDetails) {
    users[index] = updatedDetails;
  }

  FutureOr<void> homeUserCardClickedNavigateEvent(
      HomeUserCardClickedNavigateEvent event, Emitter<UserState> emit) async {
  
    emit(HomeNavigateToEditUserDetailsPageActionState(
        clickedUser: event.clickedUserCard,
        clickedUserCardIndex: event.userCardIndex));
  }

  FutureOr<void> onSaveButtonClickedForEditUserEvent(
      OnSaveButtonClickedForEditUserEvent event,
      Emitter<UserState> emit) async {
    emit(FormLoadingState());
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (event.formState) {
      emit(
        FormSaveSuccessfulState(),
      );
    } else {
      emit(
        FormSaveFailureState(),
      );
    }
  }

  FutureOr<void> editUserDetailsEvent(
      EditUserDetailsEvent event, Emitter<UserState> emit) {
    editUserDetails(
      event.userCardIndex,
      event.updatedUserDetails,
    );
    emit(
      NavigateToHomePageState(),
    );
    emit(
      UserListLoadedState(users: users),
    );
  }

  //Common for adding and editing User details
  FutureOr<void> onCancelButtonClickedEvent(
      OnCancelButtonClickedEvent event, Emitter<UserState> emit) {
    emit(
      NavigateToHomePageState(),
    );
    emit(
      FormNavigateToHomePageState(),
    );
  }

  FutureOr<void> formValidationFailedEvent(
      FormValidationFailedEvent event, Emitter<UserState> emit) {
    emit(NavigateToHomePageState());
    emit(UserListLoadedState(users: users));
  }
}
