import 'package:flutter/material.dart';
import 'package:flutternewcovid/countryData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutternewcovid/containers_design/designGlobalStats.dart';
import 'package:flutternewcovid/countryData.dart';

class GlobalStats extends StatefulWidget {
  @override
  _GlobalStatsState createState() => _GlobalStatsState();
}

class _GlobalStatsState extends State<GlobalStats> {
  var data;
  int cases,deaths,recovered,active,critical,todayCases,todayDeaths;
  Future getData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    if(response.statusCode == 200) {
      String dataDATA = response.body;
      data = json.decode(dataDATA);
      setState(() {
        cases = data['cases'];
        deaths = data['deaths'];
        recovered = data['recovered'];
        active = data['active'];
        critical = data['critical'];
        todayCases = data['todayCases'];
        todayDeaths = data['todayDeaths'];
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
      appBar: AppBar(
        title: Text(
          'Global Stats',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: DesignGlobalStats(
                type: 'Cases',
                value: cases.toString(),
                backgroundColor: Color(0xFFFFE0E6),
                typeColor: Color(0xFFFF5F81),
                valueColor: Colors.red.shade900,
              ),
            ),
            Expanded(
              child: DesignGlobalStats(
                type: 'Active',
                value: active.toString(),
                backgroundColor: Colors.blue.shade50,
                typeColor: Color(0xFF7DBCFF),
                valueColor: Colors.blue.shade900,
              ),
            ),
            Expanded(
              child: DesignGlobalStats(
                type: 'Recovered',
                value: recovered.toString(),
                backgroundColor: Color(0xFFE4F4E8),
                typeColor: Color(0xFF78C88A),
                valueColor: Colors.green.shade900,
              ),
            ),
            Expanded(
              child: DesignGlobalStats(
                type: 'Deaths',
                value: deaths.toString(),
                backgroundColor: Colors.grey.shade100,
                typeColor: Color(0xFFCDD0D3),
                valueColor: Colors.grey,
              ),
            ),
            Expanded(
              child: DesignGlobalStats(
                type: 'Critical',
                value: critical.toString(),
                backgroundColor: Color(0xFFFFE0E6),
                typeColor: Color(0xFFFF5F81),
                valueColor: Colors.red.shade900,
              ),
            ),
            Expanded(
              child: DesignGlobalStats(
                type: 'Today Cases',
                value: todayCases.toString(),
                backgroundColor: Color(0xFFFFE0E6),
                typeColor: Color(0xFFFF5F81),
                valueColor: Colors.red.shade900,
              ),
            ),
            Expanded(
              child: DesignGlobalStats(
                type: 'Today Deaths',
                value: todayDeaths.toString(),
                backgroundColor: Colors.grey.shade100,
                typeColor: Color(0xFFCDD0D3),
                valueColor: Colors.grey,
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.black,
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CountryData()));
              },
              child: Text(
                'Country-wise Stats',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
