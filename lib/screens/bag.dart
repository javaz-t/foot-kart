import 'package:flutter/material.dart';
import 'package:shoe_kart/widgets/Bag/product_count.dart';
import 'package:shoe_kart/widgets/Bag/text.dart';
import 'package:shoe_kart/widgets/text.dart';

import '../widgets/Bag/bottom_sheet.dart';
class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BagBottomSheet(subtotal: '500', delivary: '50', total: '550',),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             MediumFont(font: 'My Cart', size: 20),

                ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                    margin: EdgeInsets.all(6),
                    height: 170,
                    width: double.infinity,
                    // color: Color.fromARGB(255, 203, 153, 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //SizedBox(width: 10,),
                        Container(
                          height: 120,
                          width: 120,
                          child: Image.asset('assets/images/sqr.jpg',fit: BoxFit.fill,),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MediumFont(font: 'NIke Shoes24'),
                            PriceFont(
                              price: 1600,
                            ),
                            ProductCount(),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            SizeText(size: '40'),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outline_outlined,
                                size: 40,color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
