import 'dart:io';

import 'package:flutter/material.dart';

import 'package:my_places/core/screen_size.dart';
import 'package:my_places/core/sqlite_helper.dart';
import 'package:my_places/models/place_model.dart';
import 'package:my_places/widgets/custom_button.dart';

import 'package:my_places/widgets/custom_location_container.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.place});
  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: Color(0xff0F172A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(place.imagePath),
              width: ScreenSize.width,
              height: ScreenSize.height * 0.4,
              fit: BoxFit.fill,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSize.height * 0.032,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSize.height * 0.025,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.01),
                  Text(
                    place.description,
                    style: TextStyle(
                      color: Color(0xff94A3B8),
                      fontSize: ScreenSize.height * 0.021,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Text(
                    'Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSize.height * 0.025,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomLocationContainer(
                        txt: 'latitude',
                        place: place.latitude.toString(),
                      ),
                      CustomLocationContainer(
                        txt: 'longitude',
                        place: place.longitude.toString(),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  OutlinedButton(
                    onPressed: () async {},
                    style: OutlinedButton.styleFrom(
                      iconColor: Colors.white,
                      backgroundColor: Color(0x4D1E293B),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.open_in_new, color: Colors.white),
                        SizedBox(width: ScreenSize.width * 0.02),
                        Text(
                          'Open in Maps',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.white),
                      SizedBox(width: ScreenSize.width * 0.02),
                      Text(
                        place.date.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        txt: 'Edit',
                        onPressed: () {},
                        color: Color(0x1E293B4D),
                      ),
                      CustomButton(
                        txt: 'Delete',
                        onPressed: () async {
                          await SqliteHelper.deletePlace(int.parse(place.id!));
                          Navigator.pop(context);
                        },
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
