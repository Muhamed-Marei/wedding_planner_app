import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/home_screen/view/screens/current_screen.dart';
import '../../../../gloubale/function/get_image_from_gall.dart';
import '../../../../gloubale/widgets/text_form_field.dart';
import '../../../../main.dart';
import '../../../sign_in_provider.dart';
import '../../model/user_regestration_model.dart';
import '../../provider/user_image_regestration_provider.dart';
import '../../view_model/add_user_data_to_firebase.dart';
import '../widgets/user_regestration_image_widget.dart';

class RegistrationScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late String imageLink;
  RegistrationScreen({Key? key}) : super(key: key) {
    phoneController.text = currentUserData.phoneNumber != null
        ? currentUserData.displayName!
        : "enter your phone";
    nameController.text = currentUserData.displayName != null
        ? currentUserData.displayName!
        : "enter your name";
    emailController.text = currentUserData.email != null
        ? currentUserData.email!
        : "enter your email";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const userRegestrationImageWidget(),
              EnterDataTextFormFiled(
                onChangedFun: (val){},
                icon: Icons.perm_identity,
                textInputType: TextInputType.name,
                labelText: 'ادخل الاسم',
                validator: validateName,
                controller: nameController,
              ),
              EnterDataTextFormFiled(
                onChangedFun: (val){},
                icon: Icons.email,
                textInputType: TextInputType.emailAddress,
                labelText: 'ادخل الاميل',
                validator: validateEmail,
                controller: emailController,
              ),
              EnterDataTextFormFiled(
                onChangedFun: (val){},
                icon: Icons.phone_iphone_rounded,
                textInputType: TextInputType.phone,
                labelText: 'ادخل الهاتف',
                validator: validateMobile,
                controller: phoneController,
              ),
             Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
               return  ElevatedButton.icon(
                 onPressed: () {
                    uploadFile(imageFile:  ref.watch(CurrentImageFileProvuder.state).state  ).then((value) {
                      addUserData(userModel:UserRegestrationModel(imageUrl: value, uId: currentUserData.uid,
                          name: nameController.text, phone:phoneController.text , email: emailController.text) );
                      mainWidgetRef.watch(mainHomeScreenProvider.state).state = const CurrentScreen();
                    });
                 },
                 label: Text("التالى"),
                 icon: Icon(Icons.arrow_forward_sharp),
               );
             },)
            ],
          ),
        ),
      ),
    );
  }
}
