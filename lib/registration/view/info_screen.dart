import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/common_widgets/custom_drop_down_text_field.dart';
import 'package:untitled5/common_widgets/custom_text_field.dart';
import 'package:untitled5/common_widgets/rectangle_button.dart';
import 'package:untitled5/common_widgets/screen_title.dart';
import 'package:untitled5/common_widgets/text_field_label.dart';
import 'package:untitled5/registration/models/education.dart';
import 'package:untitled5/registration/validation_mixin/validation_mixin.dart';
import 'package:untitled5/res/strings.dart';
import 'package:untitled5/res/styles.dart';
import 'package:untitled5/utils/app_util.dart';

class InfoScreen extends StatelessWidget with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _yearOfPassingController =
      TextEditingController();

  InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          Strings.yourInfo,
          style: appBarTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(left: 34, right: 34, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ScreenTitle(title: Strings.educationalInfo),
                const TextFieldLabel(labelName: Strings.education),
                CustomDropdownTextField(
                    validation: (education) {
                      return isValidEducation(education);
                    },
                    hintText: Strings.selectYourQualification,
                    items: education,
                    onChange: (value) {}),
                const TextFieldLabel(labelName: Strings.yearOfPassing),
                CustomTextField(
                  validation: (year) {
                    return isValidYearOfPassing(year.trim());
                  },
                  textEditingController: _yearOfPassingController,
                  readOnly: true,
                  onTap: () {
                    AppUtils().showYearPicker(
                        context: context,
                        onChange: (year) {
                          Navigator.pop(context);

                          _yearOfPassingController.text = year.year.toString();
                        });
                  },
                  hintText: Strings.enterYearOfPassing,
                ),
                /*  CustomDropdownTextField(
                    validation: (value) {},
                    hintText: Strings.enterYearOfPassing,
                    items: [],
                    onChange: (value) {}),*/
                const TextFieldLabel(labelName: Strings.grade),
                CustomTextField(
                    validation: (grade) {
                      return isValidGrade(grade);
                    },
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[a-zA-Z0-9]+$')),
                    ],
                    iconData: null,
                    hintText: Strings.enterYourGradeOfPercentage),
                const SizedBox(
                  height: 18,
                ),
                const Divider(
                  thickness: 1.8,
                ),
                const ScreenTitle(title: Strings.professionalInfo),
                const TextFieldLabel(labelName: Strings.experience),
                CustomTextField(
                    validation: (experience) {
                      return isValidExperience(experience);
                    },
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                    ],
                    inputType: TextInputType.phone,
                    iconData: null,
                    hintText: Strings.enterTheYearsOfExperience),
                const TextFieldLabel(labelName: Strings.designation),
                CustomTextField(
                  validation: (designation) {
                    return isValidDesignation(designation);
                  },
                  hintText: Strings.selectDesignation,
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z0-9]+$')),
                  ],
                ),

                /*CustomDropdownTextField(
                    validation: (value) {},
                    hintText: Strings.selectDesignation,
                    items: [],
                    onChange: (value) {}),*/
                const TextFieldLabel(labelName: Strings.domain),
                CustomTextField(
                  hintText: Strings.selectYourDomain,
                  validation: (domain) {},
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z0-9]+$')),
                  ],
                ),
                /* CustomDropdownTextField(
                    validation: (value) {},
                    hintText: Strings.selectYourDomain,
                    items: [],
                    onChange: (value) {}),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RectangleButton(
                        buttonColor: Colors.white,
                        textColor: Colors.blue,
                        buttonText: Strings.previous,
                        onClick: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: RectangleButton(
                      buttonText: Strings.next,
                      onClick: () {
                        Navigator.pushNamed(context, 'AddressScreen');

                        /*if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, 'AddressScreen');
                        }*/
                      },
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
