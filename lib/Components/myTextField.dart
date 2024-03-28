// import 'package:flutter/material.dart';

// class myTextField extends StatefulWidget {
//   const myTextField({Key? key, required this.controller, required this.iconData}) : super(key: key);
//
//   final TextEditingController controller;
//   final IconData iconData;
//
//
//   @override
//   State<myTextField> createState() => _myTextFieldState();
// }
//
// class _myTextFieldState extends State<myTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//     style: const TextStyle(color: Colors.white70),
//     cursorColor: Colors.white70,
//     controller: widget.controller,
//     obscureText: true,
//     decoration: const InputDecoration(
//     enabledBorder: OutlineInputBorder(
//     borderRadius: BorderRadius.only(
//     topRight: Radius.circular(20),
//     bottomLeft: Radius.circular(20)),
//     borderSide: BorderSide(color: Colors.white70),
//     ),
//     // focusedBorder: OutlineInputBorder(
//     //   borderRadius: BorderRadius.only(
//     //       topRight: Radius.circular(20),
//     //       bottomLeft: Radius.circular(20)),
//     //   borderSide: BorderSide(color: Colors.white70),
//     // ),
//     label: Text(
//     'Password',
//     style: TextStyle(color: Colors.white70),
//     ),
//     hintText: 'Password',
//     hintStyle: TextStyle(color: Colors.white70),
//     prefixIcon: Icon(widget.iconData, color: Colors.white70,)
//     ),
//     );
//
//   }
// }

import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {Key? key,
      required this.controller,
      required this.iconData,
      required this.hintText,
      required int width, required this.showIcon})
      : super(key: key);

  final TextEditingController controller;
  final IconData iconData; // Removed const here
  final String hintText;
  final bool showIcon;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white70),
      cursorColor: Colors.white70,
      controller: widget.controller,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          borderSide: BorderSide(color: Colors.white70),
        ),
        // label: Text(
        //   'Password',
        //   style: TextStyle(color: Colors.white70),
        // ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white70),
        suffix: widget.showIcon? Icon(widget.iconData, color: Colors.white70): SizedBox(),
      ),
    );
  }
}
