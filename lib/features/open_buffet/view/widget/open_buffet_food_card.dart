import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/food_model.dart';
import '../screen/open_buffet_screen.dart';

late List<String> currentFoodList ;
late List<String> sellectedFoodList ;

addToList({required String id}) {
  currentFoodList.add(id);
  print ("${currentFoodList.length}");
}

removeFromList({required String id}) {
  currentFoodList.remove(id);
  print ("${currentFoodList.length}");
}

class OpenBuffetCArd extends StatefulWidget {
  late FoodModel foodData;
  OpenBuffetCArd({Key? key, required this.foodData}) : super(key: key);

  @override
  State<OpenBuffetCArd> createState() => _OpenBuffetCArdState();
}

class _OpenBuffetCArdState extends State<OpenBuffetCArd> {
  bool valuo = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: (){

                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>   AlertDialog(
                      content: Container(
                          height: 300,
                          child: Column(children: [
                            Expanded(flex:  1 ,child: Image.network("${widget.foodData.imageLink}",fit: BoxFit.fill,)),
                            //Expanded(flex:  2 ,child: Text("${widget.foodData.detelis}")),
                          ],)),
                    ));


              },
              child: Image.network("${widget.foodData.imageLink}",fit: BoxFit.fill,)),
        ),
        Expanded(
          flex: 3,
          child:Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return  CheckboxListTile(
              subtitle:Column(children: [
                Text("${widget.foodData.cost}"),
           //     Text("${widget.foodData.detelis}",maxLines: 2,)
              ],),
              title: Text("${widget.foodData.name}"),
              onChanged: (bool? value) {
                setState(() {
                  valuo = !valuo;
                  if (valuo == true) {
                      ref.watch(sellectedFoodProvider.state).state.add(widget.foodData.id) ;
                  } else {
                    ref.watch(sellectedFoodProvider.state).state.remove(widget.foodData.id) ;
                  }
                });
              },
              value: valuo,
            ) ;
          },

          ),
        )
      ]),
    );
  }
}
