import 'package:flutter/material.dart';



class AdsCardViewWidget extends StatelessWidget {
  const AdsCardViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       width: 300,
        child: Card(
          elevation: 20,
          child: Stack(
            children: [
              Image.asset("assets/introduction_screen/intro2.png",fit: BoxFit.fill,)
            ],
          ),
        ),
      ),
    );
  }
}