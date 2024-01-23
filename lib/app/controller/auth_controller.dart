import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/models/usermodel.dart';
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //akun yg sudah login disimpan di _currentUser
  GoogleSignInAccount? _currentUser;

  //data yang diperlukan untuk login disimpan di userCredential
  UserCredential? userCredential;

  //inisialisasi database firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;

  //inisiasi model data user
  var userData = UserModel().obs;

  // Stream<DocumentSnapshot<Map<String, dynamic>>> getUserRoles() async* {
  //   var email = auth.currentUser!.email;
  //   yield* firestore.collection("users").doc(email).snapshots();
  // }

  Future signInGoogle() async {
    await _googleSignIn.signOut();

    _currentUser =
        await _googleSignIn.signIn().then((value) => _currentUser = value);

    final isSignIn = await _googleSignIn.isSignedIn();

    if (isSignIn) {
      GoogleSignInAuthentication? googleAuthSign =
          await _currentUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuthSign?.accessToken,
          idToken: googleAuthSign?.idToken);

      await auth
          .signInWithCredential(credential)
          .then((value) => userCredential = value);

      log("$userCredential");

      //inisiasi collection yg akan dipakai
      CollectionReference users = firestore.collection("users");

      String emailUser = auth.currentUser!.email.toString();

      users.doc(emailUser).set({
        "uid": auth.currentUser!.uid,
        "photoUrl": _currentUser!.photoUrl ?? '',
        "email": emailUser,
        "noKTP": '',
        "namaLengkap": '',
        "nomorTelepon": '',
        "alamat": '',
      });

      isAuth.value = true;

      await Get.offAllNamed(Routes.HOME);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
