
import 'package:flutter/material.dart';

import '../../../../gloubale/widgets/sub_app_bar.dart';
import '../../../home_screen/view/screens/home_screen_view.dart';
import '../../view_model/car_view_model.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBarWidget(
          nextScreenWidget: const HomeScreen(), title: 'car page'),
      body: const CarViewModel(),
    );
  }
}
