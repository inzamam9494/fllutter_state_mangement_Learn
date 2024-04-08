import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management/mvvm/resouces/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({required this.title, this.loading = false, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: loading? Padding(padding: EdgeInsets.symmetric(vertical: 2),child: CircularProgressIndicator(color: Colors.white,)) : Text(title,style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold
        ),)),
      ),
    );
  }
}
