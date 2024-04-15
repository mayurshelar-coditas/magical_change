///Data model for user details
class UserDataModel {
  UserDataModel(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.avatar});

  String name, email, phoneNumber, address, avatar;
}
