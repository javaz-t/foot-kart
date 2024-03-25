import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/functions/display_data.dart';
import 'package:shoe_kart/model/card_model.dart';
import 'package:shoe_kart/provider/product_details_provider.dart';
import 'package:shoe_kart/widgets/Bag/product_count.dart';
import 'package:shoe_kart/widgets/Bag/text.dart';
import 'package:shoe_kart/widgets/text.dart';

import '../widgets/Bag/bottom_sheet.dart';
class BagPage extends StatelessWidget {    
  final String size;
   BagPage(String string, {super.key,  this.size='10',});

  @override
  Widget build(BuildContext context) {
    fetchCard();
  
    var data = Provider.of<ProductDetailsProvider>(context,listen: false);
    return Scaffold(
      bottomSheet: BagBottomSheet(subtotal:data.productSubtotal.toString(), delivary:data.totalDelivaryCharge.toString(),
       total: data.total.toString(),),
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
          const  SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  CardModel data = cardList[index];
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
                          child: Image.network(data.imageUrl,fit: BoxFit.fill,),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MediumFont(font: data.name),
                            PriceFont(
                              price: data.price,
                            ),
                            ProductCount(data: data,),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            SizeText(size: size),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
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
