import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final IconData? iconData;
  final String hintText;
  final EdgeInsets? margin;
  final Function? validation;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isPassword;
  final Widget? suffix;
  final TextEditingController? textEditingController;
  final int? maxLength ;
  final VoidCallback? onTap ;
  final bool? readOnly ;
  const CustomTextField(
      {this.validation,
      this.iconData,
      required this.hintText,
      this.margin,
      this.inputType,
      this.inputFormatter,
      this.isPassword,
      Key? key,
      this.suffix,
      this.textEditingController, this.maxLength ,this.onTap ,this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: TextFormField(
        onTap: onTap?? (){

        },
        readOnly: readOnly?? false,
        controller: textEditingController,
        keyboardType: inputType ?? TextInputType.name,
        inputFormatters: inputFormatter,
        validator: (value) {
          return validation!(value?.trimLeft());
        },
        maxLength: maxLength,
        obscureText: isPassword ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          errorBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)) ,
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          suffixIcon: suffix,
          prefixIcon: (iconData != null)
              ? Icon(
                  iconData,
                  color: Colors.blue,
                )
              : null,
          hintText: hintText,
          hintStyle:
              const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
        ),
      ),
    );
  }
}
