import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EnterDataTextFormFiled extends StatelessWidget {
  late TextEditingController _controller;
  late IconData _icon;
  late String _labelText;
  late TextInputType _textInputType;
  late FormFieldValidator<String> _validator;
  late int? _mainLine, _maxLine;
    late Null Function(dynamic val) onChangedFun= (val){} ;
  EnterDataTextFormFiled({
    Key? key,
    required String labelText,
    required TextEditingController controller,
    required IconData icon,
    required TextInputType textInputType,
    required FormFieldValidator<String> validator,
    required this.onChangedFun,

  }) : super(key: key) {
    _validator = validator;
    _labelText = labelText;
    _controller = controller;
    _textInputType = textInputType;
    _icon = icon;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
           onChanged: onChangedFun,
            keyboardType: _textInputType,
            validator: _validator,
            textDirection: TextDirection.ltr,
            controller: _controller,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontFamily: "ReemKufi-VariableFont_wght"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(_icon),
              labelText: _labelText,
            ),
          ),
        ),
      ),
    );
  }
}

// mobile validate
String? validateMobile(value) {
  String patttern = r'(^(?:[0]1)?[0-9]{11}$)';
  RegExp regExp = RegExp(patttern);
  if (value.length == 0) {
    return 'من فضلك ادخل رقم الهاتف';
  } else if (!regExp.hasMatch(value)) {
    return 'ادخل رقم هاتف صحيح';
  }
  return null;
}

// name validate
String? validateName(val) {
  if (val.length < 3) {
    return "name should be more than 3 character ";
  } else {
    return null;
  }
}

// Cost validate
String? validateCost(val) {
  if (int.parse(val) < 20 && int.parse(val) > 10000 ) {
    return "enter a right number ";
  } else {
    return null;
  }
}
// main validate
String? validatemain(val) {
  if (int.parse(val) < 20  ) {
    return "enter a right number ";
  } else {
    return null;
  }
}
// Max validate
String? validateMax(val) {
  if (int.parse(val) > 10000 ) {
    return "enter a right number ";
  } else {
    return null;
  }
}
String? validateAddress(val) {
  if (val.length < 3) {
    return "please add all address ";
  } else {
    return null;
  }
}
String? validateDetails(val) {
  if (val.length < 10) {
    return "please add all address ";
  } else {
    return null;
  }
}

String? validateAge(val) {
  if (val.isEmpty) {
    return "please enter an age ";
  }
  if (double.parse(val) <= 100 && double.parse(val) >= 20) {
    return null;
  } else {
    return "please enter age from 20 to 100";
  }
}

String? validateEmail(val) {
  if (EmailValidator.validate(val)) {
    return null;
  } else {
    return "please enter a validate email ";
  }
}
