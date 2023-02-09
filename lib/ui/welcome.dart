import 'package:flutter/material.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    List<City> cites =
        City.citiesList.where((element) => element.isDefault == false).toList();
    List<City> selectedCities = City.getSelectedCities();
    Size? size = MediaQuery.of(context).size;
    Constants constants = Constants();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: constants.secondaryColor,
        title: Text('${selectedCities.length} selected'),
      ),
    );
  }
}
