import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/res/routes/routes_name.dart';
import 'package:getx_statemanagment_mvvm/view_models/controller/user_preference/user_prefrences_view_model.dart';

class SplashServices {
  UserPrefrences userPrefrences = UserPrefrences();
  void isLogin() {
    userPrefrences.getUser().then((value){
     if (value.isLogin==false|| value.isLogin.toString() =="null") {
       Timer(
      const Duration(seconds: 3),
      () => Get.toNamed(RouteName.loginView),
    );
     }else{
      Timer(
      const Duration(seconds: 3),
      () => Get.toNamed(RouteName.homeView),
    );
     }
    });
    
  }
}
