
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/model/card_model.dart';
import 'package:shoe_kart/provider/product_details_provider.dart';
class ProductCount extends StatelessWidget {
  final CardModel data;
   ProductCount({super.key, required this.data});
 @override
  Widget build(BuildContext context) {
    
    return Consumer<ProductDetailsProvider>(
      builder: (context,cardVal,child)=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
          ),
          IconButton(
            onPressed: () {
              if(data.quality>1){
               cardVal.removeQuality(data.id,data.quality);
              }
            },
            icon:const  Icon(
              Icons.remove_circle ,color: Color.fromARGB(168, 244, 67, 54),
            ),
          ),
         const SizedBox(
            width: 3,
          ),
          Text(
            data.quality.toString(),
            style:const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            width: 3,
          ),
          IconButton(
            onPressed: () {
              cardVal.addQuality(data.id,data.quality);
           },
            icon: const Icon(
              Icons.add_circle_outlined,color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
