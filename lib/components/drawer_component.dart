import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    @required this.title,
    @required this.leadIcon,
    @required this.color,
    @required this.onPressed,
  });
  String title;
  Icon leadIcon;
  Color color;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadIcon,
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 14.0),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: color,
      ),
      onTap: onPressed,
    );
  }
}
