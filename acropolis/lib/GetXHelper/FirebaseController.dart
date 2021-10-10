import 'package:acropolis/Screen/Dashboard.dart';
import 'package:acropolis/Screen/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController extends GetxController with StateMixin<dynamic> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<UserInfo> _firebaseUser = Rxn<UserInfo>();

  String get user => _firebaseUser.value?.email;

  // @override
  // void onInit() {
  //   _firebaseUser.bindStream(_auth.authStateChanges());
  // }

  // function to createuser, login and sign out user

  void createUser(
      String firstname, String lastname, String email, String password) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("Users");

    Map<String, String> userdata = {
      "First Name": firstname,
      "Last Name": lastname,
      "Email": email
    };
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        reference
            .add(userdata)
            .then((value) => Get.offAll(DashboardActivity()));
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error while creating account ", e.message);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAll(DashboardActivity()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error while sign in ", e.message);
    }
  }

  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(LoginPage()));
  }
}
