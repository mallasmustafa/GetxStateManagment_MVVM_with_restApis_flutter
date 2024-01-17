import 'package:getx_statemanagment_mvvm/models/login/user_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  Future<bool> saveUser(UserResponseModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", responseModel.token.toString());
    sp.setBool("isLogin", responseModel.isLogin!);
    return true;
  }

  Future<UserResponseModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    bool? isLogin = sp.getBool("isLogin");
    return UserResponseModel(
      token: token,
      isLogin:isLogin,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
