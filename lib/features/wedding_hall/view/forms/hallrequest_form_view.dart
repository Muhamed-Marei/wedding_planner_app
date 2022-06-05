import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../gloubale/widgets/text_form_field.dart';
import '../../../../sign_in/sign_in_provider.dart';
import '../../../open_buffet/view/screen/open_buffet_screen.dart';
import '../../model/hall_model.dart';
import '../../model/request_model.dart';
import '../../wedding_hall_filteration/view_model/wedding_hall_filter_vm.dart';
import '../../wedding_hall_filteration/view/fillter_page_screen.dart';

class RequestAlertFormView extends StatelessWidget {
  late HallModel hallData;
  late String hallName,
      address,
      city,
      hallId,
      centerId,
      details,
      phone,
      weddingType;
  
  late bool openBuffet, dj;
  late List<dynamic> imageList;
  late double costPerPerson;
  late int maxPerson, minPerson,totalCost , hallCost;
  RequestAlertFormView({Key? key, required this.hallData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController personController = TextEditingController();
    TextEditingController notesController = TextEditingController();
    

    return Form(

      key: _formKey,
      child: AlertDialog(
        elevation: 20,
        title: Center(child: Text(hallData.hallName)),
        content: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return IntrinsicHeight(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("cost Pear all person"),
                      subtitle: Text("${hallData.costPerPerson}"),
                    ),


                    Row(
                      children: [
                        Expanded(
                          child: DateTimePicker(
                            type: DateTimePickerType.date,
                            initialValue: '',
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.date_range),
                            onChanged: (val) {
                              dateController.text = val;
                            },
                            validator: (val) {
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: DateTimePicker(
                            icon: Icon(Icons.access_time_sharp),
                            type: DateTimePickerType.time,
                            initialValue: '',
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            dateLabelText: 'time',
                            onChanged: (val) {
                              timeController.text = val;
                            },
                            validator: (val) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                          "min ${hallData.minPerson} max ${hallData.maxPerson}"),
                      subtitle: Container(
                        width: 400,
                        child: EnterDataTextFormFiled(
                          onChangedFun: (val) {
                            ref.watch(totaleCostProvider.state).state =
                                int.parse(val);
                          },
                          textInputType: TextInputType.number,
                          controller: personController,
                          labelText: 'number of person',
                          icon: Icons.account_circle,
                          validator: (val) {
                            if (val!.length != 0) {
                              int _val = int.parse(val);
                              if (_val < hallData.maxPerson &&
                                  _val > hallData.minPerson) {
                                return "enter a right number ";
                              } else {
                                return null;
                              }
                            } else {
                              return "please enter number ";
                            }
                          },
                        ),
                      ),
                    ),
                    Text(
                      
                        " Totle cost :${ref.watch(totaleCostProvider.state).state * hallData.costPerPerson} "),
                    if (hallData.openBuffet == "true")
                      TextButton(
                          onPressed: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    OpenBuffetScreen(
                                        userId: hallData.centerId));
                          },
                          child: const Text("View open buffet")),
                    EnterDataTextFormFiled(
                      onChangedFun: (val) {},
                      textInputType: TextInputType.text,
                      controller: notesController,
                      labelText: 'add notes',
                      icon: Icons.account_circle,
                      validator: (val) {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        actions: <Widget>[
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return TextButton(
                child: const Text("Order Now"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    List x = ref.watch(sellectedFoodProvider.state).state;
                    Map requestData = RequestModel(
                            id: hallData.hallId,
                            centerId: hallData.centerId,
                            date: dateController.text,
                            numberOfPerson: personController.text,
                            sellectedFood: x,
                            time: timeController.text,
                            note: notesController.text,
                            userId: currentUserData.uid,
                            requestCase: "false",
                    totalCost:((ref.watch(totaleCostProvider.state).state * hallData.costPerPerson) ).toString()  ,
                      hallCost: (ref.watch(totaleCostProvider.state).state * hallData.costPerPerson ).toString()  ,
                    )
                        .toMap();
                    requestCollection.add(requestData);
                    ref.watch(sellectedFoodProvider.state).state.clear();
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}

CollectionReference requestCollection =
    FirebaseFirestore.instance.collection('request');

StateProvider<int> totaleCostProvider = StateProvider<int>((ref) => 0);
