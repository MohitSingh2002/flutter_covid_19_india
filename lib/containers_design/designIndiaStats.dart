import 'package:flutter/material.dart';

class DesignIndiaStats extends StatelessWidget {
  final String type;
  final String value;
  final Color backgroundColor;
  final Color typeColor;
  final Color valueColor;

  const DesignIndiaStats({Key key, this.type, this.value, this.backgroundColor, this.typeColor, this.valueColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            type,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: typeColor,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
