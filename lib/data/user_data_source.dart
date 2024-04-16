import 'package:magical_change/data/models/user_data_model.dart';

///Data source  to imitate the API calls
class UserDataSource {
  Future fetchUserData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return [
      UserDataModel(
        name: "Mayur Shelar",
        email: "mayur.shelar@coditas.com",
        phoneNumber: "9359848448",
        address: "Pune, India",
        avatar: 'assets/images/avatar6.png',
      ),
      UserDataModel(
        name: "Aditya Zanzane",
        email: "aditya.zanzane@coditas.com",
        phoneNumber: "9533564523",
        address: "Pune, India",
        avatar: 'assets/images/avatar3.png',
      ),
      UserDataModel(
        name: "Siddhant Nilage",
        email: "siddhant.nilage@coditas.com",
        phoneNumber: "9574356845",
        address: "Parbhani, India",
        avatar: 'assets/images/avatar4.png',
      ),
      UserDataModel(
        name: "Yash Wadadkar",
        email: "yash.wadadkar@coditas.com",
        phoneNumber: "9389425752",
        address: "Wardha, India",
        avatar: 'assets/images/avatar5.png',
      ),
      UserDataModel(
        name: "Gaurav Wani",
        email: "gaurav.wani@coditas.com",
        phoneNumber: "7475647548",
        address: "Jalgoan, India",
        avatar: 'assets/images/avatar2.png',
      ),
    ];
    
  }
}
