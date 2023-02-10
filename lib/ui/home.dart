import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Constants constants = Constants();
  int? temperature, maxTemperature, humidity, windSpeed;
  String? weatherStateName;
  var currentDate = 'Loading..';
  String imageUrl = '';
  int woeid =
      44418; //This is the Where on Earth Id for London which is our default city
  String location = 'London'; //Our default city
  var selectedCities = City.getSelectedCities();
  List<String> cities = [
    'London'
  ]; //the list to hold our selected cities. Default is London
  List consolidatedWeatherList = [];

  //Api calls url
  String searchLocationUrl =
      'https://www.metaweather.com/api/location/search/?query='; //To get the woeid
  String searchWeatherUrl =
      'https://www.metaweather.com/api/location/'; //to get weather details using the woeid

  void fetchLocation(String location) async {
    var searchResult = await http.get(Uri.parse(searchLocationUrl + location));
    var result = json.decode(searchResult.body);
    print(result);
    // setState(() {
    //   woeid = result['woeid'];
    // });
  }
  @override
  void initState() {
    fetchLocation(cities[0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}