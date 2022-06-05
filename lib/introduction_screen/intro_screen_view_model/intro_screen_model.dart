import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../const.dart';

PageViewModel pageViewData({required String title , required String body ,required String image}){
  PageViewModel pageViewModel=PageViewModel(
    title: title,
    body: body ,
    image:Image.asset(image),
    decoration: pageDecoration,
  );
  return pageViewModel;
}
