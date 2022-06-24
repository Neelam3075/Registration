import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  final Color? textColor ;
  final Color? buttonColor ;
  const RectangleButton({
    required this.buttonText,
    required this.onClick,this.textColor ,
    Key? key,  this.buttonColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 34),
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        side:const BorderSide(color: Colors.blue)
                    )
                ),
                backgroundColor:
                MaterialStateProperty.all(buttonColor?? Colors.blue)
            ),
            onPressed: onClick,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                buttonText,
                style:
                 TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ,color: textColor?? Colors.white),
              ),
            )));
  }
}
