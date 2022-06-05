import 'package:flutter/material.dart';

import '../../model/cars_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../gloubale/widgets/text_form_field.dart';
import '../../../../sign_in/sign_in_provider.dart';
import '../../../open_buffet/view/screen/open_buffet_screen.dart';
import '../../model/request_model.dart';

class CarCard extends StatelessWidget {
  CarsModel carModelDAta;
  CarCard({Key? key, required this.carModelDAta}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 150,
        child: GestureDetector(
          onTap: () {},
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.cyanAccent,
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CarImageWidget(
                      carModelData: carModelDAta,
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            carModelDAta.model,
                            maxLines: 2,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Text(
                          carModelDAta.address,
                          maxLines: 2,
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      RequestCarFormView(
                                        careDataModel: carModelDAta,
                                      ));
                            },
                            child: Text("Order Now"))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarImageWidget extends StatelessWidget {
  late CarsModel carModelData;
  CarImageWidget({Key? key, required this.carModelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(
        carModelData.image[0],
        fit: BoxFit.fill,
      ),
    );
  }
}

class RequestCarFormView extends StatelessWidget {
  late CarsModel careDataModel;
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
  late int maxPerson, minPerson;
  RequestCarFormView({Key? key, required this.careDataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController personController = TextEditingController();
    TextEditingController foodPadgetController = TextEditingController();
    TextEditingController notesController = TextEditingController();

    return Form(
      key: _formKey,
      child: AlertDialog(

        elevation: 20,
        title: Center(child: Text(careDataModel.model)),
        content: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return IntrinsicHeight(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      careDataModel.image[0],
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      title: const Text("cost Pear night"),
                      subtitle: Text("${careDataModel.cost}"),
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
                    EnterDataTextFormFiled(
                      onChangedFun: (val) {},
                      textInputType: TextInputType.text,
                      controller: notesController,
                      labelText: 'add notes',
                      icon: Icons.note,
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
                    Map requestData = CarRequestModel(
                            carId: careDataModel.cardId,
                            note: notesController.text,
                            clientID: currentUserData.uid,
                            date: timeController.text,
                            centerId: careDataModel.userId,
                            time: timeController.text,
                            caseRequest: "false")
                        .toMap();
                    requestCollection.add(requestData);
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
