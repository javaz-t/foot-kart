
import 'package:flutter/material.dart';
import 'package:shoe_kart/util/const.dart';
class MediumFont extends StatelessWidget {
  final double size;
  final String font;
  final bool bold;
   MediumFont ({super.key, required this.font, this.size=1,  this.bold=true, });

  @override
  Widget build(BuildContext context) {
    return Text(font,
     overflow: TextOverflow.clip , 
        style: TextStyle(
            fontSize: size, 
            fontWeight:bold==true? FontWeight.w900: null,
            color: const Color.fromARGB(255, 0, 0, 0)),maxLines: 3);
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
      const  SizedBox(width: 2,),
       const Icon(
          Icons.currency_rupee_outlined,size: 15,weight: 1000,
        ),
       kHSize10,
        Text(price.toString(),style: TextStyle(fontSize: 15  ,fontWeight: FontWeight.bold,color:Colors.grey[800]),)
      ],
    );
  }
}

