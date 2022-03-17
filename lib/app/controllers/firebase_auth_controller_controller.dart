import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/constants/constan_color.dart';

class FirebaseAuthController extends GetxController {
  // FUNCTIONALITY
  var isAuth = false.obs;

  var displayName = ''.obs;
  var displayEmail = ''.obs;

  // DEKLARASI AUTH DAN GOOGLE
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentAccount;

  // STREAM AUTH STATE
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // METHOD UNTUK GOOGLE SIGN_IN
  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      await _googleSignIn.signIn().then((value) => _currentAccount = value);

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        final googleAuth = await _currentAccount!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        // Memasukkan informasi login google ke Firebase Authentication
        auth.signInWithCredential(credential);

        isAuth.value = true;

        Get.offAllNamed(Routes.BASE_FOR_BOTTOM_NAV);
        //
      } else {
        print('Gagal SignIn dengan Google');
      }
    } catch (error) {
      print(error);
    }
  }

  // METHOD GET CURRENT USER INFORMATION
  Stream<User?> getAccountInfo()  {
    var currentUser =  auth.authStateChanges();

    try {
      currentUser.listen((User? user) {
        if (user != null) {
          print('display name : ${user.displayName}');
          print('display email : ${user.email}');
          displayName.value = user.displayName!;
          displayEmail.value = user.email!;
        }
      });
    } catch (e) {
      print(e);
    }

    return currentUser;
  }

  // METHOD UNTUK SIGN UP
  void signUp(String emailParam, String passwordParam) async {
    try {
      UserCredential userSignUp = await auth.createUserWithEmailAndPassword(
        email: emailParam,
        password: passwordParam,
      );
      if (userSignUp.user != null && !userSignUp.user!.emailVerified) {
        userSignUp.user!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: 'Error',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'Weak passwords. Try again',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            // // ==> NO LOGOUT
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Ok',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: 'Error',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'Email already registered. Sign up with another email',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            // // ==> NO LOGOUT
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Ok',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // METHOD UNTUK SIGN IN
  void signIn(String emailParam, String passwordParam) async {
    try {
      UserCredential userSignin = await auth.signInWithEmailAndPassword(
        email: emailParam,
        password: passwordParam,
      );
      if (userSignin.user!.emailVerified == true) {
        Get.offAllNamed(Routes.BASE_FOR_BOTTOM_NAV);
        //
      } else {
        Get.defaultDialog(
          title: 'Login Failed',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'Your email has not been verified',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            // // ==> NO LOGOUT
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Ok',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email is not registered');
        Get.defaultDialog(
          title: 'Login Failed',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'Email is not registered. Registor Now',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            // // ==> NO LOGOUT
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Ok',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: 'Wrong Password',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'The password you entered is wrong. Try again',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Ok',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }
    }
  }

  // METHOD UNTUK LOG OUT
  void logOut() async {
    await auth.signOut();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.SIGN_UP);
  }

  // METHOD UNTUK RESET PASSWORD
  void resetPassword(String emailParam) async {
    if (emailParam != '' && GetUtils.isEmail(emailParam)) {
      try {
        await auth.sendPasswordResetEmail(email: emailParam);
        //
        Get.defaultDialog(
          title: 'Reset Password',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'Password reset is successful. Check your e-mail',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Ok',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      } catch (e) {
        print(e);
      }
      //
    } else {
      Get.defaultDialog(
        title: 'Email is required',
        titleStyle: TextStyle(
          color: cBlack,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        middleText: 'Email is required. Try again',
        middleTextStyle: TextStyle(
          color: cGrey,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        backgroundColor: cWhite,
        radius: 10,
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(30, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: cWhite,
              onPrimary: cBlack,
              elevation: 0,
            ),
            child: DefaultText(
              text: 'Ok',
              fontSize: 14,
              textColor: cBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }
  }
}
