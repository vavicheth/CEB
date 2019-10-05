import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';

class TextBoxField extends StatelessWidget {
  TextBoxField(
      {@required this.textCtrl,
      @required this.textHint,
      @required this.textInputType});
  TextEditingController textCtrl;
  String textHint;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: TextField(
          style: TextStyle(color: primaryDark),
          controller: textCtrl,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: textHint,
            hintStyle: TextStyle(color: secondaryColor),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 1.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 1.0)),
          ),
          obscureText: false,
        ),
      ),
    );
  }
}
