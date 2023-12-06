import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:veegilbank/core/util/coloors.dart';
import 'package:veegilbank/features/mobilebank/presentation/widgets/custom_appbar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  final bool _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(4.h),
        child: const CustomAppBar('Transaction history'),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 2.w, right: 2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isEmpty
                ? Center(
                    child: Container(
                      height: 8.h,
                      width: 30.w,
                      child: Column(
                        children: [
                          Icon(
                            Icons.list_outlined,
                            size: 6.h,
                          ),
                          Spacer(),
                          Text('No transactions'),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 2.h),
                      padding: EdgeInsets.only(
                          left: 3.w, right: 3.w, top: 2.h, bottom: 2.h),
                      height: 10.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Coloors.greyDark.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3.h)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Sent:'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('N5,0000,0000'),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text('To    :'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('08080891204'),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('4/12/2023'),
                            ],
                          ),
                        ],
                      ),
                    );
                  }))
          ],
        ),
      ),
    );
  }
}
