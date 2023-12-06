import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(4.h),
        child: const CustomAppBar('Profile'),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 10.h,
              width: 10.h,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle),
              child: const Center(
                child: Text(
                  'V',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Account:'),
                Text('080891204'),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Created:'),
                Text('04/12/2023'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
