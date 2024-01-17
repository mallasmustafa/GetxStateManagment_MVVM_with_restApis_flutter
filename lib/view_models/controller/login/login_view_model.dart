import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/data/app_exceptions.dart';
import 'package:getx_statemanagment_mvvm/models/login/user_response_model.dart';
import 'package:getx_statemanagment_mvvm/reposirory/login_repository/login_repository.dart';
import 'package:getx_statemanagment_mvvm/res/components/general_exceptions.dart';
import 'package:getx_statemanagment_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_statemanagment_mvvm/res/routes/routes_name.dart';
import 'package:getx_statemanagment_mvvm/utils/utils.dart';
import 'package:getx_statemanagment_mvvm/view_models/controller/user_preference/user_prefrences_view_model.dart';

class LoginViewModel extends GetxController {
  UserPrefrences userPrefrences = UserPrefrences();
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool isLoading = false.obs;

  void loginApi() async {
    isLoading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };

    try {
      var value = await _api.loginApi(data);
      isLoading.value = false;
      if (value["error"] == "user not found") {
        Utils.snackBar(value["error"], "Login");
      } else if (value["error"] == "Missing email or username") {
      } else {
        UserResponseModel userResponseModel = UserResponseModel(
          token: value["token"],
          isLogin: true,
        );
        userPrefrences.saveUser(userResponseModel).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.homeView);
        }).onError((error, stackTrace) {});
        Utils.snackBar("Login successfully", "Login");
      }
    } on InternetException {
      isLoading.value = false;
      Get.to(InternetExceptionWidget(
        onPress: () {
          Get.offNamed(RouteName.loginView);
        },
      ));
    } on RequestTimeOut {
      isLoading.value = false;
      Get.to(GeneralExceptionWidget(
        onPress: () {
          Get.offNamed(RouteName.loginView);
        },
      ));
    } catch (e) {
      isLoading.value = false;
      Utils.snackBar("An unexpected error occurred", "Error");
    }
  }
}
