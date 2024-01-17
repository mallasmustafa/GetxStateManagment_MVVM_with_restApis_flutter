import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/data/response/status.dart';
import 'package:getx_statemanagment_mvvm/res/colors/app_colors.dart';
import 'package:getx_statemanagment_mvvm/res/components/general_exceptions.dart';
import 'package:getx_statemanagment_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_statemanagment_mvvm/res/routes/routes_name.dart';
import 'package:getx_statemanagment_mvvm/view/home/widgets/user_list_api_widget.dart';
import 'package:getx_statemanagment_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_statemanagment_mvvm/view_models/controller/user_preference/user_prefrences_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeViewModel());
    UserPrefrences userPrefrences = UserPrefrences();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              userPrefrences.removeUser().then((value) {
                Get.offNamed(RouteName.loginView);
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.Loading:
            return const Center(child: CircularProgressIndicator());
          case Status.Error:
            if (homeController.error.value == "No Internet") {
              return InternetExceptionWidget(onPress: () {
                homeController.refreshApi();
              });
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.refreshApi();
              });
            }
          case Status.Completed:
            return const UserListWidget();
        }
      }),
    );
  }
}
