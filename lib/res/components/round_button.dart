import 'package:flutter/material.dart';
import 'package:getx_statemanagment_mvvm/res/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final bool isLoading;
  final String tittle;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
  const RoundButton({
    super.key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.primaryTextColor,
    this.isLoading = false,
    required this.tittle,
    this.height = 50,
    this.width = 60,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  tittle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
