
import 'package:flutter/material.dart';
class MediumFont extends StatelessWidget {
  final double size;
  final String font;
  final bool bold;
   MediumFont ({super.key, required this.font, this.size=1,  this.bold=true, });

  @override
  Widget build(BuildContext context) {
    return Text(font,
     overflow: TextOverflow.ellipsis, 
        style: TextStyle(
            fontSize: size,
            fontWeight:bold==true? FontWeight.w900: null,
            color: Colors.grey),maxLines: 3 ,);
  }
}
//for rupee icon included icon
class PriceFont extends StatelessWidget {
  final double price;

  const PriceFont({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 2,),
        Icon(
          Icons.currency_rupee_outlined,size: 15,weight: 1000,
        ),
        SizedBox(width: 10,),
        Text(price.toString(),style: TextStyle(fontSize: 15  ,fontWeight: FontWeight.bold,color:Colors.grey[800]),)
      ],
    );
  }
}

