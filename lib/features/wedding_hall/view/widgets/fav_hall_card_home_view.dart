
import 'package:flutter/material.dart';



class FavCardViewWidget extends StatelessWidget {
   FavCardViewWidget({Key? key,required this.image}) : super(key: key);
  late String image ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Image.network(image,fit: BoxFit.fill,),
        ),
      ),
    );
  }
}