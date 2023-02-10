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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cites.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: size.height * .08,
            width: size.width,
            decoration: BoxDecoration(
              border: cites[index].isSelected == true
                  ? Border.all(
                      color: constants.secondaryColor.withOpacity(.6),
                    )
                  : Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: constants.primaryColor.withOpacity(.2),
                  blurRadius: 7,
                  spreadRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      cites[index].isSelected = !cites[index].isSelected!;
                    });
                  },
                  child: Image.asset(
                    cites[index].isSelected == true
                        ? 'assets/checked.png'
                        : 'assets/unchecked.png',
                    width: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  cites[index].city!,
                  style: TextStyle(
                    fontSize: 16,
                    color: cites[index].isSelected == true
                        ? constants.primaryColor
                        : Colors.black,
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: constants.secondaryColor,
        child: const Icon(Icons.pin_drop),
      ),
    );
  }
}
