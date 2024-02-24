import 'package:flutter/material.dart';
import 'package:shoe_kart/screens/bag.dart';
import 'package:shoe_kart/widgets/text.dart';

import '../util/const.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}
class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? selectedIndex;
  int selectedColor=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                        ),
                      ),
                    ),
                    MediumFont(font: 'Category of Shoe', size: 20),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BagPage()),
                          );
                        },
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 10, right: 10, bottom: 10),
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: MediumFont(font: 'Product Name')),
                MediumFont(
                    bold: false,
                    size: 15,
                    font:
                        'Elevate your runs with the Nike Air Max 270 React. Boasting a revolutionary cushioning system and a sleek design, these shoes offer unparalleled comfort and style for every stride.'),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: MediumFont(
                      font: 'Colors',
                      size: 20,
                    )),
                Container(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                          child: InkWell(
                            onTap: (){
                             setState(() {
                               selectedColor= index;
                             });

                            },
                            child: CircleAvatar(
                              backgroundColor: colors[index],
                            ),
                          ),
                        );
                      }),
                ),
                Center(child: Text(colorNames[selectedColor],style: TextStyle(fontWeight: FontWeight.bold),),),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: MediumFont(
                      font: 'Size',
                      size: 20,
                    )),
                Container(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (contex, index) {
                        int size = index + 2;
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                          child: InkWell(
                          borderRadius: BorderRadius.circular(60),
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor:selectedIndex!=index?Colors.white:Colors.deepPurple,
                              child: Text(size.toString(),style: TextStyle(color: selectedIndex!=index?Colors.black:Colors.white),),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1400',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BagPage()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.deepPurple),
                            child: Center(
                                child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            )),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}