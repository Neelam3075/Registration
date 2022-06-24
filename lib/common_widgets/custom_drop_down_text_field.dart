import 'package:flutter/material.dart';

class CustomDropdownTextField extends StatelessWidget {
  const CustomDropdownTextField(
      {Key? key,
      required this.hintText,
      required this.items,
      required this.onChange,
      this.margin,
      required this.validation,
      this.value})
      : super(key: key);

  final String hintText;
  final List<String> items;
  final Function(String? value) onChange;
  final EdgeInsets? margin;
  final FormFieldValidator<String>? validation;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: DropdownButtonFormField<String>(
        onChanged: (value) {
          onChange(value);
        },
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        validator: validation,
        isExpanded: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
        hint: Text(
          hintText,
          style:
              const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
