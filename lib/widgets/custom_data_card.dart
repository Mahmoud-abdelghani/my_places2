import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class CustomDataCard extends StatelessWidget {
  const CustomDataCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.latitude,
    required this.longitude,
    required this.category,
    required this.date,
    required this.onTap,
  });
  final String title;
  final String description;
  final String imagePath;
  final double latitude;
  final double longitude;
  final String category;
  final DateTime date;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
        color: Color(0xff1E293B),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.file(
                  File(imagePath),
                  width: ScreenSize.width,
                  height: ScreenSize.height * 0.25,
                  fit: BoxFit.fill,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenSize.height * 0.02,
                    right: ScreenSize.width * 0.02,
                    left: ScreenSize.width * 0.73,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width * 0.02,
                    vertical: ScreenSize.height * 0.005,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(81, 155, 53, 244),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(color: Color.fromARGB(255, 155, 53, 244)),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenSize.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSize.height * 0.029,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Color(0xff94A3B8),
                      fontSize: ScreenSize.height * 0.02,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff94A3B8),
                            size: ScreenSize.height * 0.02,
                          ),
                          Text(
                            '$latitude, $longitude',
                            style: TextStyle(
                              color: Color(0xff94A3B8),
                              fontSize: ScreenSize.height * 0.017,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Color(0xff94A3B8),
                            size: ScreenSize.height * 0.02,
                          ),
                          Text(
                            '${date.day}/${date.month}/${date.year}',
                            style: TextStyle(
                              color: Color(0xff94A3B8),
                              fontSize: ScreenSize.height * 0.017,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.height * 0.015),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
