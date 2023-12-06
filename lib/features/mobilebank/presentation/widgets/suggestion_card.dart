import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/util/coloors.dart';

class SuggestionCard extends StatelessWidget {
  final String text;
  const SuggestionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 19.w,
      constraints: BoxConstraints(
        maxHeight: 7.h,
        minWidth: 18.w,
      ),
      decoration: BoxDecoration(
          color: Coloors.naturalGrey, borderRadius: BorderRadius.circular(28)),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
