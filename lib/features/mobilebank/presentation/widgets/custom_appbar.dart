import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/util/coloors.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(4.h),
      child: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Coloors.greyDark,
          ),
          onPressed: () {},
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          text,
          style: const TextStyle(
            color: Coloors.greyDark,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
