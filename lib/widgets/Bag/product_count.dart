
import 'package:flutter/material.dart';
class ProductCount extends StatefulWidget {
   ProductCount({super.key});

  @override
  State<ProductCount> createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
int initialCount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 40,
        ),
        IconButton(
          onPressed: () {
            if(initialCount>1){
              setState(() {
                initialCount--;
              });
            }

          },
          icon: Icon(
            Icons.remove_outlined,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          initialCount.toString(),
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          width: 3,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              initialCount++;
            });
          },
          icon: Icon(
            Icons.add_circle_outlined,
          ),
        ),
      ],
    );
  }
}
