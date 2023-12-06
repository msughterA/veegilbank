import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(4.h),
        child: const CustomAppBar('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('App Theme'),
            ),
            RadioListTile(
                title: Text('Dark Theme'),
                value: 'Dark',
                groupValue: 'Theme',
                onChanged: (value) {}),
            RadioListTile(
                title: Text('Light Theme'),
                value: 'Dark',
                groupValue: 'Theme',
                onChanged: (value) {}),
            RadioListTile(
                title: Text('Adaptive '),
                value: 'Dark',
                groupValue: 'Theme',
                onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
