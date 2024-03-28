import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/myButtons.dart';
import 'package:shrub_hub/Components/myTextField.dart';
import 'package:shrub_hub/SignUp.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPaswordState();
}

class _forgotPaswordState extends State<forgotPassword> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Reset Password")),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/img2.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextField(
                  controller: email,
                  iconData: Icons.text_fields,
                  hintText: AutofillHints.email,
                  width: 150,
                  showIcon: false),
              customButton(
                  buttonText: "Send",
                  onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signUp()))
                      },
                  buttonHeight: 68,
                  buttonWidth: 118)
            ],
          ),
        ],
      ),
    );
  }
}
