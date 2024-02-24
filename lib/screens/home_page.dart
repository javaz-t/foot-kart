import 'package:flutter/material.dart';
import 'package:shoe_kart/screens/product_details.dart';
import 'package:shoe_kart/widgets/text.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                    child: Column(
            children: [
              const Text(
                'Foot Kart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color to white
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                child: const TextField(

                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, color: Colors.grey), // Search icon
                    hintText: 'Looking for shoes...', // Placeholder text
                    border: InputBorder.none, // Remove the default border
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15.0), // Padding inside the TextField
                  ),
                ),
              ),
              Container(
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(2),
                        height: 20,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Brand '),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
              ),
               Align(
                alignment: Alignment.topLeft,
                child: MediumFont(font: ' Popular Shoes'),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        height: 250,
                        width: 350,
                        color: Colors.green,
                        child: Text('dd'),
                      );
                    }),
              ),
              const Divider(
                indent: 40,
                endIndent: 40,
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap:() {
                        Navigator
                            .push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsPage()),);
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 290,
                          width: 150,
                          color: Colors.white,
                          child: Column(

                            children: [

                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 150,width: 165,color: Colors.green,
                              ),
                              SizedBox(height: 3  ,),
                             Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: Align(alignment: Alignment.bottomLeft,child: MediumFont(font: 'Nike Jordan',size: 20,)),
                             ),
                          PriceFont(price: 1500)
          ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
                    ),
                  ),
          )),
    );
  }
}
