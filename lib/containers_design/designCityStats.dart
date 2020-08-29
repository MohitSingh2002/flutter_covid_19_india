import 'package:flutter/material.dart';

class DesignCityStats extends StatelessWidget {
  final String type;
  final String value;
  final Color backgroundColor;
  final Color typeColor;
  final Color valueColor;

  const DesignCityStats({Key key, this.type, this.value, this.backgroundColor, this.typeColor, this.valueColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: backgroundColor,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Text(
            type,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: typeColor,
              fontFamily: 'Staatliches',
            ),
          ),
          SizedBox(
            width: 70,
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
