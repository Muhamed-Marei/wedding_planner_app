import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';

class CountryStateWidget extends StatefulWidget {
  TextEditingController cityNameController;
  CountryStateWidget({required this.cityNameController});
  _HomePageState createState() =>
      _HomePageState(cityNameController: cityNameController);
}
class _HomePageState extends State<CountryStateWidget> {
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController cityNameController;
  _HomePageState({required this.cityNameController});
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AlertDialog(
        title: const Text('add new hall'),
        content: IntrinsicHeight(
          child: Column(
            children: [
              CountryStateCityPicker(
                country: country,
                state: state,
                city: city,
                textFieldInputBorder: UnderlineInputBorder(),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                cityNameController.text = state.text;
              },
              child: Text("Done")),
        ],
      ),
    );
  }
}
