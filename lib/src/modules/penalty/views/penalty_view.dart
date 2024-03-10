import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenaltyView extends StatelessWidget {
  const PenaltyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("জরিমানা",style: h2.copyWith(color: white),),
        actions: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: white
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.history,color: black,),
                    Text("পেনাল্টি হিস্ট্রি",style: h3,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("জরিমানা",style: h1.copyWith(fontSize: 26),),
            Text("বাতিলকৃত ট্রিপ এর সংখ্যা ভিত্তিতে আপনাকে নির্দিষ্ট অঙ্কের অর্থ জরিমানা হিসাবে প্রদান করতে হবে",style: h4.copyWith(fontSize: 16),),
            SizedBox(height: 10,),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: black.withOpacity(0.4)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("আপনার সর্বমোট 0 টি \nট্রিপ বাতিল করেছেন ",style: h1.copyWith(fontSize: 16,fontWeight: FontWeight.bold),),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: grey.shade300
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_month,color: black,),
                                    Text("March 2024",style: h3,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                  
                     SizedBox(
                       height: Get.height / 1.7,
                       child: ListView.builder(
                         itemCount: 10,
                           scrollDirection: Axis.vertical,
                           itemBuilder: (context,index){
                             return Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("${index + 1} টি ট্রিপ ক্যান্সেলে",style: h3,),
                                     Text("-${150 * (index + 1)} টাকা",style: h3.copyWith(color: Colors.red),),
                                   ],
                                 ),
                                 Container(
                                   height: 10,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     color: Colors.yellow.withOpacity(0.6),
                                   ),
                                 ),
                                 SizedBox(height: 5,),
                               ],
                             );
                           }
                       ),
                     )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
