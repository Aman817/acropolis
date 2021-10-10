import 'package:acropolis/GetXHelper/FirebaseController.dart';
import 'package:acropolis/helper/color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'RegistrationPage.dart';

// ignore: must_be_immutable
class LoginPage extends GetWidget<FirebaseController> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: Vx.m20,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightBox(10),
                    "Sign in".text.bold.xl5.color(ui).make(),
                    "Welcome".text.xl2.make(),
                    HeightBox(20),
                    fromui("Email", email),
                    HeightBox(20),
                    fromui("Password", pass),
                    HeightBox(20),
                    GestureDetector(
                        onTap: () {
                          print("Login Clicked Event");
                          _login();
                        },
                        child: "Login"
                            .text
                            .white
                            .light
                            .xl
                            .makeCentered()
                            .box
                            .white
                            .color(ui)
                            .roundedLg
                            .make()
                            .w(MediaQuery.of(context).size.width)
                            .h(40)),
                    HeightBox(20),
                  ],
                ),
              ),
            ),
          ),
        )),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegistrationPage()));
          },
          child: RichText(
              text: TextSpan(
            text: '    New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Register Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 18, color: ui),
              ),
            ],
          )).pLTRB(20, 0, 0, 15),
        ));
  }

  Widget fromui(String title, TextEditingController controller) {
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ui1, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: ui1, width: 3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                  color: ui1,
                ),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                )),
            new Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,

                  isDense: true, // Added this
                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                ),
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ));
  }

  void _login() {
    controller.login(email.text, pass.text);
  }
}
