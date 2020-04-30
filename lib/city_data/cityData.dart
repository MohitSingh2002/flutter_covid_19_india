import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutternewcovid/containers_design/designCityStats.dart';

class CityData extends StatefulWidget {
  final String state;
  final String city;

  const CityData({Key key, this.state, this.city}) : super(key: key);
  @override
  _CityDataState createState() => _CityDataState();
}

class _CityDataState extends State<CityData> {
  int confirmed,active,recovered,deceased,todayCase,todayDeath,todayRecovered;
  Future<dynamic> getData() async {
    http.Response response = await http.get('https://api.covid19india.org/state_district_wise.json');
    if(response.statusCode == 200) {
      String data=response.body;
      var dataDATA=json.decode(data);
      setState(() {
        confirmed=dataDATA[widget.state]['districtData'][widget.city]['confirmed'];
        active=dataDATA[widget.state]['districtData'][widget.city]['active'];
        recovered=dataDATA[widget.state]['districtData'][widget.city]['recovered'];
        deceased=dataDATA[widget.state]['districtData'][widget.city]['deceased'];
        todayCase=dataDATA[widget.state]['districtData'][widget.city]['delta']['confirmed'];
        todayDeath=dataDATA[widget.state]['districtData'][widget.city]['delta']['deceased'];
        todayRecovered=dataDATA[widget.state]['districtData'][widget.city]['delta']['recovered'];
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(
                widget.city,
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'LexendGiga',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Expanded(
              child: DesignCityStats(
                type: 'Confirmed',
                value: confirmed.toString(),
                backgroundColor: Color(0xFFFFE0E6),
                typeColor: Color(0xFFFF5F81),
                valueColor: Colors.red.shade900,
              ),
            ),
            Expanded(
              child: DesignCityStats(
                type: 'Active',
                value: active.toString(),
                backgroundColor: Colors.blue.shade50,
                typeColor: Color(0xFF7DBCFF),
                valueColor: Colors.blue.shade900,
              ),
            ),
            Expanded(
              child: DesignCityStats(
                type: 'Recovered',
                value: recovered.toString(),
                backgroundColor: Color(0xFFE4F4E8),
                typeColor: Color(0xFF78C88A),
                valueColor: Colors.green.shade900,
              ),
            ),
            Expanded(
              child: DesignCityStats(
                type: 'Deceased',
                value: deceased.toString(),
                backgroundColor: Colors.grey.shade100,
                typeColor: Color(0xFFCDD0D3),
                valueColor: Colors.grey,
              ),
            ),
            Expanded(
              child: DesignCityStats(
                type: 'Today Case',
                value: todayCase.toString(),
                backgroundColor: Color(0xFFFFE0E6),
                typeColor: Color(0xFFFF5F81),
                valueColor: Colors.red.shade900,
              ),
            ),
            Expanded(
              child: DesignCityStats(
                type: 'Today Recovered',
                value: todayRecovered.toString(),
                backgroundColor: Color(0xFFE4F4E8),
                typeColor: Color(0xFF78C88A),
                valueColor: Colors.green.shade900,
              ),
            ),
            Expanded(
              child: DesignCityStats(
                type: 'Today Deceased',
                value: todayDeath.toString(),
                backgroundColor: Colors.grey.shade100,
                typeColor: Color(0xFFCDD0D3),
                valueColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
