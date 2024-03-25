
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/functions/display_data.dart';
import 'package:shoe_kart/model/product_details.dart';
import 'package:shoe_kart/provider/product_details_provider.dart';
import 'package:shoe_kart/screens/product_details.dart';
import 'package:shoe_kart/widgets/text.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return   Consumer<ProductDetailsProvider>(
      builder: (context,value,child)=>GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:value.productsShowInUI.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemBuilder: (BuildContext context, int index) {
                        ProductDetails data =  value.productsShowInUI[index];
                          // DocumentSnapshot productData = productsShowInUI[index] as DocumentSnapshot<Object?>;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(productData: data,)),
                              );
                            },
                            child: Card(
                              elevation: 10,
                              child: Container(
                                height:350,
                                width: 150, 
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 160,  
                                      width: 165,
                                      child: Image.network(
                                       data.images[0],
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Padding(  
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: MediumFont(
                                            font: data.name,
                                            size: 15,
                                          )),
                                    ),
                                    PriceFont(price: data.price)
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
    );
                
  }
}