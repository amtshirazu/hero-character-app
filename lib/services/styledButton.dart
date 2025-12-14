import 'package:flutter/material.dart';
import 'package:hero_characters/services/themes.dart';



class StyledButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.primaryAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: child,
      ),

    );
  }
}
