import 'package:flutter/material.dart';
class HomePageTitleStyle extends StatelessWidget {
  late String _title;
  HomePageTitleStyle({Key? key, required String title}) : super(key: key) {
    _title = title;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8),
      child: Text(
        _title,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: const TextStyle(
            color: Colors.cyan,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "ReemKufi-VariableFont_wght"
        ),
      ),
    );
  }
}
