import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_kart/screens/bag.dart';
import 'package:shoe_kart/widgets/rounded_icon_button.dart';
import 'package:shoe_kart/widgets/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util/const.dart';

class ProductDetailsPage extends StatefulWidget {
  final DocumentSnapshot productData;
  const ProductDetailsPage({super.key, required this.productData, });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}
class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? selectedIndex;
  int selectedColor=0;
PageController _pageController = PageController();
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
                   RoundedIconButton(iconData: Icons.arrow_back_ios_outlined, onPressed: (){Navigator.pop(context);}),
                    MediumFont(font:widget.productData['name'], size: 20),
                   SizedBox(width: 20,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 10, right: 10, bottom: 10),
                  child: Container(
                    height:  450, // Adjust the height as needed
                    width: double.infinity,
                    color: Colors.white, // Background color of the container
                    child: Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          children: [
                            Container(
                              height:  450,
                              width: double.infinity,
                              color: Colors.red,
                            ),
                            Container(
                              height:  450,
                              width: double.infinity,
                              color: Colors.blue,
                            ),
                            Container(
                              height:  450,
                              width: double.infinity,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SmoothPageIndicator(
                                controller: _pageController,
                                count:  3,
                                effect: ExpandingDotsEffect(
                                  dotColor: Colors.grey,
                                  activeDotColor: Colors.blue,
                                  dotHeight:  8,
                                  dotWidth:  8,
                                  expansionFactor:  2,
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: MediumFont(font:widget.productData['name'])),
                MediumFont(
                    bold: false,
                    size: 15,
                    font:
                       widget.productData['description']),
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
                              backgroundColor: shoeColors[index],
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
                      itemCount: widget.productData['sizes'].length,
                      itemBuilder: (contex, index) {
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
                              child: Text( widget.productData['sizes'][index].toString(),style: TextStyle(color: selectedIndex!=index?Colors.black:Colors.white),),
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
                      const Column(
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
                            child: const Center(
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
