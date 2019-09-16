import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    @required this.title,
    @required this.leadIcon,
    @required this.onPressed,
  });
  String title;
  IconData leadIcon;
  Color color = secondaryWhite;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadIcon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 14.0),
      ),
//      trailing: Icon(
//        Icons.arrow_forward_ios,
//        color: color,
//      ),
      onTap: onPressed,
    );
  }
}
