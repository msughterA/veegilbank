import 'package:flutter/material.dart';

import '../../../../core/util/coloors.dart';
import 'package:sizer/sizer.dart';

class CustomKeyPad extends StatelessWidget {
  CustomKeyPad({
    super.key,
  });

  final List<String> _keys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'C',
    '0',
    '<'
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Coloors.naturalGrey,
              borderRadius: BorderRadius.all(Radius.circular(4.h))),
          child: Container(
            margin: EdgeInsets.only(
              bottom: 10.h,
              left: 12.w,
              right: 12.w,
              top: 0.8.h,
            ),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                itemCount: _keys.length,
                itemBuilder: (context, index) {
                  return GridTile(
                      child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          '${_keys[index]}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ));
                }),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 8.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.h),
                  color: Theme.of(context).colorScheme.primary),
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ))
      ],
    ));
  }
}
