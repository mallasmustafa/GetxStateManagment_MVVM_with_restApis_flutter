import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/res/colors/app_colors.dart';
import 'package:getx_statemanagment_mvvm/res/components/round_button.dart';
import 'package:getx_statemanagment_mvvm/view/login/widgets/text_form_field_widget.dart';
import 'package:getx_statemanagment_mvvm/view_models/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginViewModel());
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryButtonColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidget(
              formKey: emailFormKey,
              snackBarMessage: "Please enter email field correctly",
              snackBarTittle: "email_hint".tr,
              controller: loginController.emailController.value,
              focusNode: loginController.emailFocusNode.value,
              currentFocus: loginController.emailFocusNode.value,
              nextFocus: loginController.passwordFocusNode.value,
              hintText: "email_hint".tr,
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              formKey: passwordFormKey,
              snackBarMessage: "Please enter password field correctly",
              snackBarTittle: "password_hint".tr,
              controller: loginController.passwordController.value,
              focusNode: loginController.passwordFocusNode.value,
              currentFocus: loginController.passwordFocusNode.value,
              nextFocus: loginController.emailFocusNode.value,
              hintText: "password_hint".tr,
            ),
            const SizedBox(height: 40),
            loginButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget loginButtonWidget() {
    return Obx(() => RoundButton(
          tittle: "login".tr,
          isLoading: loginController.isLoading.value,
          onPress: () {
            if (emailFormKey.currentState!.validate() &&
                passwordFormKey.currentState!.validate()) {
              loginController.loginApi();
            }
          },
          width: 200,
        ));
  }
}
