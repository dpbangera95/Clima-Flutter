import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('initState called.');
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    double myMarginAsDouble;
    try {
      myMarginAsDouble = double.parse(myMargin);

//      Center(
//        child: RaisedButton(
//          onPressed: () {
//            //Get the current location
//            getLocation();
//          },
//          child: Text('Get Location'),
//        ),
//      ),

    } catch (e) {
      print(e);
    }

    return Scaffold();
  }
}
