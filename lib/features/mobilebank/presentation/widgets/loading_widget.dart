import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoadingWidget extends StatelessWidget {
  final String processName;
  const LoadingWidget({super.key, required this.processName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 16.h,
        width: 100.w,
        child: Column(
          children: [
            const CircularProgressIndicator(),
            SizedBox(
              height: 2.h,
            ),
            Text('$processName Loading.....')
          ],
        ),
      ),
    );
  }
}
