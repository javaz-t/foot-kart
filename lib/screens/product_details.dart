import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/model/product_details.dart';
import 'package:shoe_kart/provider/product_details_provider.dart';
import 'package:shoe_kart/screens/bag.dart';
import 'package:shoe_kart/widgets/rounded_icon_button.dart';
import 'package:shoe_kart/widgets/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util/const.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductDetails productData;
  ProductDetailsPage({
    super.key,
    required this.productData,
  });

  int? selectedIndex;
  int selectedColor = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Consumer<ProductDetailsProvider>(
              builder: (context, detailsCtrl, child) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kHSize10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundedIconButton(
                          iconData: Icons.arrow_back_ios_outlined,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      MediumFont(font: productData.name, size: 20),
                      kVSize30
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 10, right: 10, bottom: 10),
                    child: Container(
                      height: 450, // Adjust the height as needed
                      width: double.infinity,
                      color: Colors.white, // Background color of the container
                      child: Stack(
                        children: [
                          PageView.builder(
                            itemCount: productData.images.length,
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 450, // Adjust the height as needed
                                  width: double.infinity,
                                  color: Colors
                                      .white, // Background color of the container
                                  child:
                                      Image.network(productData.images[index]));
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SmoothPageIndicator(
                                  controller: _pageController,
                                  count: productData.images.length,
                                  effect: const ExpandingDotsEffect(
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.blue,
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    expansionFactor: 2,
                                  ),
                                ),
                                kHSize10
                              ],
                            ), 
                          ),
                          Positioned(
                              top: 20,
                              right: 20,
                              child: IconButton(
                                  onPressed: () {
                                   detailsCtrl.addToFavList(productData);
                                   
                                  },
                                  icon: detailsCtrl.nameList.contains(productData.name)?
                                    const Icon(
                                          Icons.favorite,
                                          size: 35,
                                           color: Color.fromARGB(255, 249, 42, 42),
                                        )
                                      : const Icon(
                                          Icons.favorite_border,
                                          size: 35,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        )
                                        )
                                        )
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: MediumFont(font: productData.name)),
                  MediumFont(
                      bold: false, size: 15, font: productData.description),
                 kHSize30,
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
                            padding:const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 10),
                            child: InkWell(
                              onTap: () {
                                selectedColor = index;
                              },
                              child: CircleAvatar(
                                backgroundColor: shoeColors[index],
                              ),
                            ),
                          );
                        }),
                  ),
                  Center(
                    child: Text(
                      colorNames[selectedColor],
                      style:const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
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
                        itemCount: productData.sizes.length,
                        itemBuilder: (contex, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(60),
                              onTap: () {
                                selectedIndex = index;
                              },
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: selectedIndex != index
                                    ? Colors.white
                                    : Colors.deepPurple,
                                child: Text(
                                  productData.sizes[index].toString(),
                                  style: TextStyle(
                                      color: selectedIndex != index
                                          ? Colors.black
                                          : Colors.white),
                                ),
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
                            const Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              productData.price.toString(),
                              style: const TextStyle(
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
                                    builder: (context) =>const BagPage()),
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
                  ),
                  kVSize30,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
