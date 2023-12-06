import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SuccessPage extends StatelessWidget {
  final String processName;
  const SuccessPage({super.key, required this.processName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 32.h,
          width: 100.w,
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
          ),
          child: Column(
            children: [
              Icon(
                Icons.verified,
                size: 8.h,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text('$processName Successful'),
              SizedBox(
                height: 4.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sent:'),
                  Text('N5000'),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('To:'), Text('08080891240')],
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    // Do something here
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(5.h)),
                  child: Text('Go Back'))
            ],
          ),
        ),
      ),
    );
  }
}
