import 'package:flutter/material.dart';
import 'package:tasawak/ui/utils/app_color.dart';

class CustomButtonWidget extends StatelessWidget {
  String title;
  Function()? onPressed;

  CustomButtonWidget({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
