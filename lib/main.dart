import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutternewcovid/containers_design/designIndiaStats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutternewcovid/city_stats/cityStats.dart';
import 'package:flutternewcovid/location_finder/locationFinder.dart';
import 'package:flutternewcovid/global_stats/globalStats.dart';
import 'package:flutternewcovid/faqs/faqs.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.red.shade200,
    ),
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var data;
  int cases,active,recovered,deaths;
  Future getData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/countries/India?yesterday&strict&query%20");
    if(response.statusCode == 200) {
      String dataDATA=response.body;
      data = json.decode(dataDATA);
      setState(() {
        cases = data['cases'];
        active = data['active'];
        recovered = data['recovered'];
        deaths = data['deaths'];
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final drawerItems = ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Android Singh'),
          accountEmail: Text('mohitsingh11082002@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('images/android_singh.PNG'),
          ),
        ),
        ListTile(
          title: Text(
              'State-wise Stats'
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CityStats()));
          },
        ),
        ListTile(
          title: Text(
              'Stats based on your location '
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LocationFinder()));
          },
        ),
        ListTile(
          title: Text(
              'Global Stats'
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GlobalStats()));
          },
        ),
        ListTile(
          title: Text(
            'FAQ\'s'
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FAQs()));
          },
        ),
      ],
    );
    return BackdropScaffold(
      title: Text('COVID-19 India'),
      iconPosition: BackdropIconPosition.action,
      headerHeight: 100.0,
      backLayer: drawerItems,
      frontLayer: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Text(
              'Cases in India',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Girassol',
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DesignIndiaStats(
                        type: 'Confirmed',
                        value: cases.toString(),
                        backgroundColor: Color(0xFFFFE0E6),
                        typeColor: Color(0xFFFF5F81),
                        valueColor: Colors.red.shade900,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: DesignIndiaStats(
                        type: 'Active',
                        value: active.toString(),
                        backgroundColor: Colors.blue.shade50,
                        typeColor: Color(0xFF7DBCFF),
                        valueColor: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DesignIndiaStats(
                        type: 'Recovered',
                        value: recovered.toString(),
                        backgroundColor: Color(0xFFE4F4E8),
                        typeColor: Color(0xFF78C88A),
                        valueColor: Colors.green.shade900,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: DesignIndiaStats(
                        type: 'Deceased',
                        value: deaths.toString(),
                        backgroundColor: Colors.grey.shade100,
                        typeColor: Color(0xFFCDD0D3),
                        valueColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
