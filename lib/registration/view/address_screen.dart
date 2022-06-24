import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/common_widgets/custom_drop_down_text_field.dart';
import 'package:untitled5/common_widgets/custom_text_field.dart';
import 'package:untitled5/common_widgets/rectangle_button.dart';
import 'package:untitled5/registration/models/education.dart';
import 'package:untitled5/registration/validation_mixin/validation_mixin.dart';
import 'package:untitled5/res/strings.dart';
import 'package:untitled5/res/styles.dart';
import 'package:untitled5/utils/app_util.dart';

class AddressScreen extends StatelessWidget with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,

        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          Strings.yourAddress,
          style: appBarTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(left: 34, right: 34, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                    validation: (address) {
                      return isValidAddress(address);
                    },
                    iconData: Icons.location_city,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    hintText: Strings.address),
                CustomTextField(
                    iconData: Icons.location_city,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    validation: (landmark) {
                      return isValidLandmark(landmark);
                    },
                    hintText: Strings.landmark),
                CustomTextField(
                    iconData: Icons.location_city,
                    validation: (city) {},
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
                    ],
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    hintText: Strings.city),
                CustomDropdownTextField(
                    validation: (value) {
                      return isValidState(value);
                    },
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    hintText: Strings.selectYourState,
                    items: state,
                    onChange: (val) {}),
                CustomTextField(
                    validation: (pinCode) {
                      return isValidPinCode(pinCode);
                    },
                    maxLength: 6,
                    inputType: TextInputType.number,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    iconData: Icons.location_city,
                    hintText: Strings.pinCode),
                RectangleButton(
                    buttonText: Strings.submit,
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        AppUtils().permissionDialog(
                            context: context,
                            message: Strings.registeredSuccessfully);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
