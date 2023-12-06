import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_key_pad.dart';
import '../../widgets/suggestion_card.dart';

class AmountPage extends StatelessWidget {
  const AmountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(4.h),
        child: const CustomAppBar('Enter Amount'),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // container to hold the text
            Container(
              height: 28.h,
              width: 100.w,
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'N0.00',
                    style: TextStyle(
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
            // container to hold all the suggestion cards
            Container(
              height: 8.h,
              width: 100.w,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SuggestionCard(text: 'N500'),
                  SuggestionCard(text: 'N1,000'),
                  SuggestionCard(text: 'N5,000'),
                  SuggestionCard(text: 'N10,000'),
                  SuggestionCard(text: 'N20,000')
                ],
              ),
            ),
            CustomKeyPad()
          ],
        ),
      ),
    );
  }
}
