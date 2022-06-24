import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled5/common_widgets/custom_text_field.dart';
import 'package:untitled5/common_widgets/rectangle_button.dart';
import 'package:untitled5/common_widgets/text_field_label.dart';
import 'package:untitled5/registration/cubit/registration_cubit.dart';
import 'package:untitled5/registration/validation_mixin/validation_mixin.dart';
import 'package:untitled5/res/strings.dart';
import 'package:untitled5/res/styles.dart';
import 'package:untitled5/utils/app_util.dart';

class RegistrationPage extends StatelessWidget with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            Strings.register,
            style: appBarTitleTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<RegistrationCubit, RegistrationState>(
                    builder: (context, state) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: (state.imagePath != null)
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    child: (kIsWeb)
                                        ? Image.network(
                                            state.imagePath!,
                                            fit: BoxFit.fill,
                                            filterQuality:
                                                FilterQuality.medium,
                                          )
                                        : Image.file(
                                            File(state.imagePath!),
                                            fit: BoxFit.fill,
                                            filterQuality:
                                                FilterQuality.medium,
                                          ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person,
                                      size: 80,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * 0.27,
                            child: InkWell(
                              onTap: () async {
                                AppUtils().customImageSourceDialog(
                                    context: context,
                                    cameraAction: () async {
                                      if (kIsWeb) {
                                      /*  final cameras =
                                            await availableCameras();

                                        final firstCamera = cameras.first;
                                        Navigator.pushNamed(
                                            context, TakePictureScreen.id,
                                            arguments: firstCamera);*/
                                      } else {
                                        context
                                            .read<RegistrationCubit>()
                                            .clickImage(
                                                imageSource:
                                                    ImageSource.camera);
                                      }
                                    },
                                    galleryAction: () {
                                      context
                                          .read<RegistrationCubit>()
                                          .clickImage(
                                              imageSource:
                                                  ImageSource.gallery);
                                    });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1.8,
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  )),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  const TextFieldLabel(labelName: Strings.firstName),
                  CustomTextField(
                    hintText: Strings.enterYourFirstNameHere,
                    iconData: Icons.person,
                    validation: (firstName) {
                      return isFirstNameValid(firstName);
                    },
                  ),
                  const TextFieldLabel(labelName: Strings.lastName),
                  CustomTextField(
                    hintText: Strings.enterYourLastNameHere,
                    iconData: Icons.person,
                    validation: (lastName) {
                      return isLastNameValid(lastName);
                    },
                  ),
                  const TextFieldLabel(labelName: Strings.phoneNumber),
                  CustomTextField(
                    inputType: TextInputType.number,
                    hintText: Strings.enterYourPhoneNumber,
                    iconData: Icons.phone,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[0-9]+$')),
                    ],
                    validation: (phoneNumber) {
                      return isPhoneNumberValid(phoneNumber);
                    },
                  ),
                  const TextFieldLabel(labelName: Strings.email),
                  CustomTextField(
                    hintText: Strings.emailGoesYear,
                    iconData: Icons.email,
                    validation: (email) {
                      return isEmailValid(email);
                    },
                    inputType: TextInputType.emailAddress,
                  ),
                  const TextFieldLabel(labelName: Strings.gender),
                  BlocBuilder<RegistrationCubit, RegistrationState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          const Text(
                            Strings.female,
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Radio<bool?>(
                              value: true,
                              groupValue: state.genderGroup ?? true,
                              onChanged: (value) {
                                context
                                    .read<RegistrationCubit>()
                                    .onRadioChange(value);
                              }),
                          const SizedBox(
                            width: 25,
                          ),
                          const Text(Strings.male,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black)),
                          Radio<bool?>(
                              value: false,
                              groupValue: state.genderGroup ?? true,
                              onChanged: (value) {
                                context
                                    .read<RegistrationCubit>()
                                    .onRadioChange(value);
                              }),
                        ],
                      );
                    },
                  ),
                  const TextFieldLabel(labelName: Strings.password),
                  BlocBuilder<RegistrationCubit, RegistrationState>(
                    builder: (context, state) {
                      return CustomTextField(
                        textEditingController: _passwordController,
                        suffix: InkWell(
                            onTap: () {
                              context
                                  .read<RegistrationCubit>()
                                  .passwordVisibility();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                (state.passwordVisibility ?? false)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.blue,
                                size: 34,
                              ),
                            )),
                        hintText: Strings.enterPassword,
                        iconData: Icons.lock,
                        validation: (password) {
                          return isPasswordValid(password);
                        },
                        isPassword: state.passwordVisibility ?? true,
                      );
                    },
                  ),
                  const TextFieldLabel(labelName: Strings.confirmPassword),
                  CustomTextField(
                    hintText: Strings.enterPassword,
                    iconData: Icons.lock,
                    validation: (confirmPassword) {
                      return isConfirmPasswordValid(
                          _passwordController.text, confirmPassword);
                    },
                    isPassword: true,
                  ),
                  BlocBuilder<RegistrationCubit, RegistrationState>(
                    builder: (context, state) {
                      return RectangleButton(
                        buttonText: Strings.next,
                        onClick: () {
                          Navigator.pushNamed(context, "InfoScreen");

                          /* if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, "InfoScreen");
                          }*/
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
