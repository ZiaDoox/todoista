import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String pageTitle;
  final double spacing = 30;

  AppBarTitle({this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Container(
              width: 10,
              margin: EdgeInsets.only(right: spacing),
              child: Icon(Icons.arrow_back_ios),),
            Text(pageTitle),],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15),
            alignment: Alignment(0.0, 0.3),
            child: Icon(Icons.search),),
          Container(
            alignment: Alignment(0.0, 0.25),
            child: Icon(Icons.settings),
          )

        ],)
      ],
    );
  }
}