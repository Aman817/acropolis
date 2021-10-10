import 'package:acropolis/GetXHelper/FirebaseController.dart';
import 'package:acropolis/Screen/LoginPage.dart';
import 'package:acropolis/helper/color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class RegistrationPage extends GetWidget<FirebaseController> {
  final TextEditingController firstn = TextEditingController();
  final TextEditingController lastn = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: Vx.m20,
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeightBox(10),
                      "Sign Up".text.bold.xl5.color(ui).make(),

                      "Create your account".text.xl2.make(),
                      // CupertinoFormSection(
                      //     header: "Personal Details".text.make(),
                      //     children: [
                      //       Container(
                      //         decoration: BoxDecoration(
                      //           border: Border.all(color: ui1, width: 3),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10)),
                      //         ),
                      //         child: CupertinoFormRow(
                      //           prefix: Container(
                      //             decoration: BoxDecoration(
                      //               border: Border.all(color: ui1, width: 3),
                      //               borderRadius: BorderRadius.only(
                      //                 topLeft: Radius.circular(10),
                      //                 bottomLeft: Radius.circular(10),
                      //               ),
                      //             ),
                      //             child: "First Name".text.make(),
                      //           ),
                      //           child: CupertinoTextFormFieldRow(
                      //             placeholder: "Enter Name",
                      //           ),
                      //         ),
                      //       )
                      //     ]),
                      HeightBox(20),

                      fromui(
                        "First Name",
                        firstn,
                      ),
                      HeightBox(20),
                      fromui(
                        "Last Name",
                        lastn,
                      ),
                      HeightBox(20),
                      fromui(
                        "Email",
                        email,
                      ),
                      HeightBox(20),
                      fromui(
                        "Password",
                        password,
                      ),

                      HeightBox(50),
                      GestureDetector(
                          onTap: () {
                            final close = context.showLoading(msg: "Loading");
                            Future.delayed(4.seconds,
                                close); // Removes toast after 2 seconds
                            registerUser();
                          },
                          child: "Sign-Up"
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: RichText(
              text: TextSpan(
            text: 'Already have an account?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Sign in Now',
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

  void registerUser() {
    controller.createUser(firstn.text, lastn.text, email.text, password.text);
  }
}
