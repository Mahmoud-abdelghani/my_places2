import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';
import 'package:my_places/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.onChanged,
    required this.onSelected,
  });
  final Function(bool)? onChanged; // Function(bool)?;
  final Function(String?)? onSelected;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),

        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: ScreenSize.height * 0.029,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
              tileColor: Theme.of(context).cardColor,
              leading: Image.asset('assets/Container3.png'),
              title: Text(
                'Theme ',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              subtitle: Text('Dark Mode', style: TextStyle(color: Colors.grey)),
              trailing: Switch(
                activeColor: Theme.of(context).primaryColorDark,
                value: themeMode == ThemeMode.dark,
                onChanged: widget.onChanged,
              ),
            ),
            SizedBox(height: ScreenSize.height * 0.02),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
              tileColor: Theme.of(context).cardColor,
              leading: Image.asset('assets/Container4.png'),
              title: Text(
                'Language ',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              subtitle: Text('English', style: TextStyle(color: Colors.grey)),
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(
                    'English',
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                  ),
                  dropdownColor: Theme.of(context).cardColor,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  items: <String>['English', 'Arabic'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value == 'Arabic' ? 'ar' : 'en',
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: widget.onSelected,
                ),
              ),
            ),
            SizedBox(height: ScreenSize.height * 0.02),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
              tileColor: Theme.of(context).cardColor,
              leading: Image.asset('assets/Container5.png'),
              title: Text(
                '3 places saved',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              subtitle: Text(
                '3 places saved',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  'Clear',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: ScreenSize.height * 0.02,
                  ),
                ),
              ),
            ),
            SizedBox(height: ScreenSize.height * 0.02),
            SizedBox(height: ScreenSize.height * 0.02),
            Text(
              'About',
              style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenSize.height * 0.02,
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
              tileColor: Theme.of(context).cardColor,
              leading: Image.asset('assets/Container6.png'),
              title: Text(
                'My Places Journal',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              subtitle: Text(
                'App Version 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
