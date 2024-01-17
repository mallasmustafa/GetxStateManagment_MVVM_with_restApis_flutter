import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/view_models/controller/home/home_view_model.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
   final homeController = Get.put(HomeViewModel());
    return ListView.builder(
      itemCount: homeController.userList.value.data!.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(homeController
                    .userList.value.data![index].avatar
                    .toString())),
            title: Text(homeController.userList.value.data![index].firstName
                .toString()),
            subtitle: Text(
                homeController.userList.value.data![index].email.toString()),
          ),
        );
      },
    );
  }
}
