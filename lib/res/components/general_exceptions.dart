import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/res/colors/app_colors.dart';
import 'package:getx_statemanagment_mvvm/res/components/round_button.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({super.key, required this.onPress});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: height * 0.15),
            const Icon(
              Icons.cloud_off,
              color: AppColor.redColor,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  "general_exception".tr,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: height * 0.15),
            RoundButton(
              tittle: "Retry",
              onPress: widget.onPress,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
