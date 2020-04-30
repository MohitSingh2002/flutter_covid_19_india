import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryData extends StatefulWidget {
  @override
  _CountryDataState createState() => _CountryDataState();
}

class _CountryDataState extends State<CountryData> {
  List countryData;
  Future getCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    super.initState();
    getCountryData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Countries Stats'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: countryData == null ? 0 : countryData.length,
            itemBuilder: (context, index){
              return Card(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.network(
                          countryData[index]['countryInfo']['flag'],
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          countryData[index]['country'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Cases: '+countryData[index]['cases'].toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Active: '+countryData[index]['active'].toString(),
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Recovered: '+countryData[index]['recovered'].toString(),
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Deaths: '+countryData[index]['deaths'].toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
