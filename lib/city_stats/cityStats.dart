import 'package:flutter/material.dart';
import 'package:flutternewcovid/city_data/cityData.dart';

class CityStats extends StatefulWidget {
  @override
  _CityStatsState createState() => _CityStatsState();
}

class _CityStatsState extends State<CityStats> {
  List<DropdownMenuItem<String>> list=[];
  String selected,nameCITY;
  void loadData() {
    list=[];
    list.add(new DropdownMenuItem(
      child: Text('Andaman and Nicobar Islands'),
      value: 'Andaman and Nicobar Islands',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Andhra Pradesh'),
      value: 'Andhra Pradesh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Arunachal Pradesh'),
      value: 'Arunachal Pradesh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Assam'),
      value: 'Assam',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Andhra Pradesh'),
      value: 'Andhra Pradesh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Bihar'),
      value: 'Bihar',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Chandigarh'),
      value: 'Chandigarh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Chhattisgarh'),
      value: 'Chhattisgarh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Delhi'),
      value: 'Delhi',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Goa'),
      value: 'Goa',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Gujarat'),
      value: 'Gujarat',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Haryana'),
      value: 'Haryana',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Himachal Pradesh'),
      value: 'Himachal Pradesh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Jammu and Kashmir'),
      value: 'Jammu and Kashmir',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Jharkhand'),
      value: 'Jharkhand',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Karnataka'),
      value: 'Karnataka',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Kerala'),
      value: 'Kerala',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Ladakh'),
      value: 'Ladakh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Madhya Pradesh'),
      value: 'Madhya Pradesh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Maharashtra'),
      value: 'Maharashtra',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Manipur'),
      value: 'Manipur',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Meghalaya'),
      value: 'Meghalaya',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Mizoram'),
      value: 'Mizoram',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Odisha'),
      value: 'Odisha',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Puducherry'),
      value: 'Puducherry',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Punjab'),
      value: 'Punjab',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Rajasthan'),
      value: 'Rajasthan',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Tamil Nadu'),
      value: 'Tamil Nadu',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Telangana'),
      value: 'Telangana',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Tripura'),
      value: 'Tripura',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Uttar Pradesh'),
      value: 'Uttar Pradesh',
    ));
    list.add(new DropdownMenuItem(
      child: Text('Uttarakhand'),
      value: 'Uttarakhand',
    ));
    list.add(new DropdownMenuItem(
      child: Text('West Bengal'),
      value: 'West Bengal',
    ));
  }
  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        title: Text(
          'Enter State and City'
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              DropdownButton(
                value: selected,

                hint: Text('Select State'),
                onChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                items: list,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Enter Your City',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    nameCITY=value;
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CityData(state: selected, city: nameCITY,)));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.orange.shade100,
                child: Text(
                  'Get Data',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
