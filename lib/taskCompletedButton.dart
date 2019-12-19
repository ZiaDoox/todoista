import 'package:flutter/material.dart';

class CheckedButton extends StatefulWidget {
  @override
  _CheckedButtonState createState() => _CheckedButtonState();
}

class _CheckedButtonState extends State<CheckedButton> {

  Icon taskCompletedIcon = new Icon (
    Icons.radio_button_unchecked, 
  );

  bool taskCompleted = false;



  @override
  Widget build(BuildContext context) {

    _toggleIcon() {
      if(taskCompletedIcon.icon == Icons.radio_button_unchecked) {
        taskCompleted = true;
        taskCompletedIcon = new Icon(Icons.radio_button_checked);
      }else {
        taskCompleted = false;
        taskCompletedIcon = new Icon(Icons.radio_button_unchecked);
      }
    }

    return  Container(
      /*decoration: BoxDecoration(
        border: Border(right: BorderSide(width: 0.1)),
      ),*/
      //margin: EdgeInsets.only(left: 5),
      padding: EdgeInsets.only(right: 2, left: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            _toggleIcon();
          });
        },
        child: taskCompletedIcon,
      ));
  }
}