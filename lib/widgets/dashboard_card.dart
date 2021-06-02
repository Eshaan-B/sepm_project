import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final double height;
  final String text;
  final Function onTap;

  MyCard({this.color, this.height, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        color: color,
        shadowColor: Colors.amberAccent,
        child: Container(
            padding: EdgeInsets.all(20),
            height: height,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              text,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )),
      ),
    );
  }
}
