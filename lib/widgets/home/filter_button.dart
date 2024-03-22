import 'package:flutter/material.dart';
import 'package:shoe_kart/widgets/filter_sheet.dart';
import 'package:shoe_kart/widgets/rounded_icon_button.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Positioned(
            bottom: 47,
            right: 30,
            child: RoundedIconButton(
                iconData: Icons.tune_outlined,
                onPressed: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return FilterPage(); 
                    },
                  );
                }),
          );
  }
}