import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/model/product_details.dart';
import 'package:shoe_kart/provider/product_details_provider.dart';
import 'package:shoe_kart/util/const.dart';
import '../widgets/text.dart';
class FavaratePage extends StatelessWidget {
  const FavaratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
          kHSize30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                MediumFont(font: 'My Favorite', size: 20),

              ],
            ),
           kHSize30,
            Expanded(
              child: Consumer<ProductDetailsProvider>(
                builder: (context,prodtCtrl,child)=>ListView.builder(
                  itemCount: prodtCtrl.favoriteProduts.length,
                  itemBuilder: (context, index) {
                ProductDetails  data =  prodtCtrl.favoriteProduts[index];
                    return Container(
                      margin:const EdgeInsets.all(6),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //SizedBox(width: 10,),
                          SizedBox(
                          height: 120,
                            width: 120,
                               child: Image.network(data.images[0],fit: BoxFit.fill,) 
                
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MediumFont(font:data.name,size: 20,),
                              PriceFont(
                                price:data.price
                              ),
                
                            ],
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                
                              },
                              icon:const Icon(
                                Icons.add_shopping_cart_outlined,size: 35,color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
