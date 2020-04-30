import 'package:flutter/material.dart';

class DesignGlobalStats extends StatelessWidget {
  final String type;
  final String value;
  final Color backgroundColor;
  final Color typeColor;
  final Color valueColor;

  const DesignGlobalStats({Key key, this.type, this.value, this.backgroundColor, this.typeColor, this.valueColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Text(
            type,
            style: TextStyle(
              color: typeColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.w900,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
