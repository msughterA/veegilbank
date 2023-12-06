import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:veegilbank/core/util/coloors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 6.h,
                  width: 6.h,
                  child: Icon(Icons.account_circle_outlined),
                  decoration: BoxDecoration(
                    color: Coloors.greyLight.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InfoCard(),
              SizedBox(
                height: 3.h,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text('Debits/Credits'),
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    height: 8.h,
                    width: 100.w,
                    padding: EdgeInsets.only(
                        left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
                    margin: EdgeInsets.only(top: 1.h),
                    decoration: BoxDecoration(
                        color: Coloors.greyLight.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2.h)),
                    child: Row(
                      children: [
                        Container(
                          height: 6.h,
                          width: 6.h,
                          decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? Colors.red
                                  : Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle),
                          child: Icon(
                            index % 2 == 0
                                ? Icons.call_received_outlined
                                : Icons.call_made_outlined,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        // amount and phoneNumber
                        Column(
                          children: [
                            Spacer(),
                            SizedBox(
                              width: 30.w,
                              height: 2.h,
                              child: Text(
                                'N2,000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 30.w,
                              height: 2.h,
                              child: Text('08080891204'),
                            ),
                            Spacer()
                          ],
                        ),
                        const Spacer(),
                        // amount and phoneNumber
                        Column(
                          children: [
                            Spacer(),
                            SizedBox(
                              width: 12.w,
                              height: 2.h,
                              child: const Text(
                                'Credit',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 18.w,
                              height: 2.h,
                              child: Text(
                                '1/12/2023',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0.5.h,
            left: 1.h,
            right: 1.h,
            child: Container(
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(3, 3),
                  ),
                ],
                // Coloors.greyDark.withOpacity(0.2)
                color: Coloors.greyDark.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 5.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                        color: Coloors.deepBlue,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Coloors.backgroundDark,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 12.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.currency_exchange,
                        ),
                        Spacer(),
                        Text(
                          'Deposit',
                          style: TextStyle(fontSize: 10),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 12.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.wallet_outlined,
                        ),
                        Spacer(),
                        Text(
                          'Transfer',
                          style: TextStyle(fontSize: 10),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 12.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.history_outlined,
                        ),
                        Spacer(),
                        Text(
                          'History',
                          style: TextStyle(fontSize: 10),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    ));
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
          color: Coloors.brightOrange,
          borderRadius: BorderRadius.circular(5.h)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Container(
                height: 7.h,
                width: 7.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
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
              const Text(
                '**** 1205',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'N2,000.50',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          SizedBox(
            height: 2.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Veegil Bank',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                '12/23',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.3),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
