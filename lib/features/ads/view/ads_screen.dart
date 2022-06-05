import 'package:flutter/material.dart';
import '../../../gloubale/widgets/sub_app_bar.dart';
import '../../home_screen/view/screens/home_screen_view.dart';
import '../../wedding_hall/view/screens/wedding_hall_screen.dart';

class AdsHomeScreen extends StatelessWidget {
  const AdsHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: SubAppBarWidget(title: 'ads screen', nextScreenWidget: WeddingHallScreen()),
      body: const Center(
        child: Text(
          "ads screen",
          style: TextStyle(color: Colors.cyan),
        ),
      ),
    );
  }
}
