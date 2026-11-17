import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class CustomLocationContainer extends StatelessWidget {
  const CustomLocationContainer({
    super.key,
    required this.txt,
    required this.place,
  });
  final String txt;
  final String place;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width * 0.45,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/Container.png'),
          ),
          SizedBox(height: ScreenSize.height * 0.01),
          Text(
            txt,
            style: TextStyle(
              color: Color(0xff94A3B8),
              fontSize: ScreenSize.height * 0.015,
            ),
          ),
          Text(
            place,
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: ScreenSize.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }
}
