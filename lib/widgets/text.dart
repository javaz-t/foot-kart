
import 'package:flutter/material.dart';
class MediumFont extends StatelessWidget {
  final double size;
  final String font;
  final bool bold;
   MediumFont ({super.key, required this.font, this.size=25,  this.bold=true, });

  @override
  Widget build(BuildContext context) {
    return Text(font,
        style: TextStyle(
            fontSize: size,
            fontWeight:bold==true? FontWeight.w900: null,
            color: Colors.grey[700]),overflow: TextOverflow.ellipsis,maxLines: 3,);
  }
}

class PriceFont extends StatelessWidget {
  final double price;

  const PriceFont({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 25,),
        Icon(
          Icons.currency_rupee_outlined,size: 20,weight: 1000,
        ),
        Text(price.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey[800]),)
      ],
    );
  }
}

