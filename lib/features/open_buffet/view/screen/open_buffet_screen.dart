import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/open_buffet_VM.dart';
import '../widget/open_buffet_food_card.dart';

class OpenBuffetScreen extends StatelessWidget {
  late String userId;
  OpenBuffetScreen({Key? key, required this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          height: 300,
          child: OpenBuffetVM(
            uId: userId,
          )),
      actions: [
        TextButton(onPressed: (){

        }, child: Text("Done"))
      ],
    );
  }
}

StateProvider<List> sellectedFoodProvider = StateProvider<List>((ref) => [],);