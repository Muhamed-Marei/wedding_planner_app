import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ServiceCardView extends StatelessWidget {
 late  String _imageLink ;
 late String _serviceName ;
   ServiceCardView({Key? key,required String imageLink ,required String serviceName}) : super(key: key){
     _imageLink =imageLink;
     _serviceName = serviceName;
   }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Stack(
        // fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            _imageLink,
            fit: BoxFit.fill,
          ),
          Container(
            height: 50,
              width: double.infinity,
              color: Colors.cyan.withOpacity(0.8),
              child:  Text(
                _serviceName,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
