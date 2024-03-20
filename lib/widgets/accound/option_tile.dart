import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTab;

  const OptionTile({super.key, required this.icon, required this.title, required this.onTab });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){onTab();},
        child: ListTile(
          leading: Icon(icon),
          title: Text(title,style: TextStyle(fontSize: 20),),

          trailing: Icon(Icons.navigate_next_outlined),
        ));
  }
}
