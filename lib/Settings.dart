import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/myButtons.dart';
import 'package:shrub_hub/Components/myTextField.dart';
import 'package:shrub_hub/Login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController editEmail = TextEditingController();
  TextEditingController editPassword = TextEditingController();
  TextEditingController changeCity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/img2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MyTextField(
                controller: editEmail,
                iconData: Icons.text_fields,
                hintText: AutofillHints.email,
                width: 200,
                showIcon: false),
            SizedBox(
              height: 24,
            ),
            MyTextField(
                controller: editPassword,
                iconData: Icons.text_fields,
                hintText: AutofillHints.password,
                width: 200,
                showIcon: false),
            SizedBox(
              height: 24,
            ),
            MyTextField(
                controller: changeCity,
                iconData: Icons.text_fields,
                hintText: AutofillHints.addressCity,
                width: 200,
                showIcon: false),
            SizedBox(
              height: 48,
            ),
            customButton(
                buttonText: "Logout",
                onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => lognIn()))
                    },
                buttonHeight: 68,
                buttonWidth: 118),
            SizedBox(
              height: 24,
            ),
            customButton(
                buttonText: "Save",
                onTap: () {},
                buttonHeight: 68,
                buttonWidth: 118),
          ],
        )
      ]),
    );
  }
}
