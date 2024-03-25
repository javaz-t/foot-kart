import 'package:flutter/material.dart';
import 'package:shoe_kart/screens/payment_screen.dart';

import '../button.dart';
class BagBottomSheet extends StatelessWidget {
  final String subtotal,delivary,total;

  const BagBottomSheet({super.key, required this.subtotal, required this.delivary, required this.total});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal',style: TextStyle(fontSize: 25,color: Colors.grey),),
            Text(subtotal,style: TextStyle(fontSize: 28,color: Colors.black),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Delivary',style: TextStyle(fontSize: 25,color: Colors.grey),),
            Text(delivary,style: TextStyle(fontSize: 28,color: Colors.black),),
          ],
        ),
        Divider(color: Colors.grey,endIndent: 15,indent: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Total',style: TextStyle(fontSize: 28,color: Colors.black),),
            Row(
              children: [
                const Icon(Icons.currency_rupee),
                Text(total,style:const TextStyle(fontSize: 28,color: Colors.black),),
              ],
            )

          ],
        ),
        Button(text: 'Checkout', onTabb: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentScreen()));
        })
      ],
    ),
    );
  }
}
