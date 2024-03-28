import 'package:flutter/material.dart';

//For Buttons:
// color: white;
//  font-size: 24px;
//  font-family: Inter;
//  font-weight: 700;
//  word-wrap: break-word


class customButton extends StatefulWidget {
  const customButton({Key? key, required this.buttonText, required this.onTap, required this.buttonHeight, required this.buttonWidth}) : super(key: key);

  final String buttonText;
  final Function()? onTap;
  final double buttonHeight;
  final double buttonWidth;
  @override
  State<customButton> createState() => _customButtonState();
}

class _customButtonState extends State<customButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.buttonHeight,
      width: widget.buttonWidth,
      child: ElevatedButton(
        child:Text(textAlign: TextAlign.center, widget.buttonText,  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, )),
        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(124, 157, 69, 50), side: BorderSide(width:1, color:Colors.white), //border width and color
          //elevation of button
          shape: RoundedRectangleBorder( //to set border radius to button
              borderRadius: BorderRadius.circular(35)
          ),) ,

        onPressed: widget.onTap,

      ),
    );
  }
}
