import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    required this.onPressed,
    required this.color,
  });
  final String txt;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Theme.of(context).dividerColor, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      color: color,
      child: Text(
        txt,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontSize: ScreenSize.width * 0.04,
        ),
      ),
    );
  }
}
