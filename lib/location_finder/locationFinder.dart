import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutternewcovid/city_data/cityData.dart';

class LocationFinder extends StatefulWidget {
  @override
  _LocationFinderState createState() => _LocationFinderState();
}

class _LocationFinderState extends State<LocationFinder> {
  String city_name, state_name;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }
  void getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      final coordinated = new Coordinates(position.latitude, position.longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinated);
      var first = addresses.first;
      setState(() {
        city_name = first.locality;
        state_name = first.adminArea;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context){
            return CityData(state: state_name, city: city_name);
          }));
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitWave(
            color: Colors.black,
            size: 50,
          ),
        ),
      ),
    );
  }
}
