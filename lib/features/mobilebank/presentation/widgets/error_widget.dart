import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  const CustomErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 16.h,
        width: 100.w,
        child: Column(
          children: [
            Icon(
              Icons.error,
              size: 8.h,
              color: Colors.red,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text('$error')
          ],
        ),
      ),
    );
  }
}
