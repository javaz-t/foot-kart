import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/widgets/button.dart';
import 'package:shoe_kart/widgets/text.dart';

import '../util/const.dart';
import 'filter/left_align_text.dart';
import 'filter/price_slider.dart';
import 'filter/select_color.dart';
import 'filter/select_size.dart';

class FilterPage extends StatelessWidget {
  FilterPage({super.key});
  int selectedCategory = 0;

  int selectedColor =0;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 650,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                MediumFont(
                  font: 'Filters',
                  size: 40,
                ),
                const LeftAlignText(text: 'Catergory'),
                SizeCategory(iteamCount: shoCategory.length, text: shoCategory),
                LeftAlignText(text: 'Size') ,
                SizeCategory(iteamCount: shoeSize.length, text: shoeSize,),
                LeftAlignText(text: 'Colors'),
                SelectColor(),
                LeftAlignText(text: 'Price',)   ,
                PriceSlider(min: 10, max: 40000,),
                SizedBox(
                  height: 10,
                ),
                Button(text: 'Apply', onTabb: (){}),
              ],
            ),
          );
        });
  }
}
