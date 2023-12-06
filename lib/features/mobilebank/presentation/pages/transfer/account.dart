import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:veegilbank/features/mobilebank/presentation/widgets/error_widget.dart';
import 'package:veegilbank/features/mobilebank/presentation/widgets/loading_widget.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_key_pad.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  final bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(4.h),
          child: const CustomAppBar('Enter Account Number'),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: _isLoading
              ? CustomErrorWidget(error: 'Transfer error')
              : AccountNumberInput(),
        ));
  }
}

class AccountNumberInput extends StatelessWidget {
  const AccountNumberInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 28.h,
          width: 100.w,
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: const Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'xxxx xxxx xx',
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        CustomKeyPad()
      ],
    );
  }
}
