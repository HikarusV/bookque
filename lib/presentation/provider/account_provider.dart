import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountProv extends ChangeNotifier {
  bool iSLogedOn = false;

  final googleSignIn = GoogleSignIn();

  UserCredential? user;
  User? userData;
  bool isNormalLogin = false;

  int testID = 0;

  void test() {
    testID++;
    notifyListeners();
  }

  void getCurentUser() {
    userData = FirebaseAuth.instance.currentUser;
    // print(userData ?? 'kosong');
  }

  void getReloadCurentUser() async {
    await FirebaseAuth.instance.currentUser!.reload();
    userData = FirebaseAuth.instance.currentUser!;
  }

  Future signInMailPass(String email, String pass) async {
    user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    isNormalLogin = true;
    userData = user!.user;
    notifyListeners();
  }

  Future signInGoogle() async {
    final googleUser = await GoogleSignIn().signIn().onError(
      (error, stackTrace) {
        return null;

        // print('Error Mas broh $error');
      },
    );
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    user = await FirebaseAuth.instance.signInWithCredential(credential);
    isNormalLogin = false;
    userData = user!.user;

    notifyListeners();
  }

  Future signInFacebook() async {
    final LoginResult facebookAuth =
        await FacebookAuth.i.login(permissions: (['email', 'public_profile']));
    // print('token facebook : ${facebookAuth.accessToken!.grantedPermissions}');
    // final graphResponse = await

    if (facebookAuth.status == LoginStatus.success) {
      AccessToken? _accessToken = facebookAuth.accessToken;

      // final token = facebookAuth.accessToken!.token;

      final credential = FacebookAuthProvider.credential(_accessToken!.token);

      final data = await FacebookAuth.i.getUserData();

      try {
        user = await FirebaseAuth.instance.signInWithCredential(credential);
        isNormalLogin = false;
        userData = user!.user;
      } on Exception catch (e) {
        print('===== Error : $e ==== END');
      }

      print(data);
      notifyListeners();
    }
  }

  Future signUp(String name, String email, String pass) async {
    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      // print('create user success');
      isNormalLogin = true;
      userData = user!.user;
      // print('cekBro : ${userData!.emailVerified}');
      userData!.sendEmailVerification();
      // userData?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future logOut() async {
    if (!isNormalLogin) {
      print('in here Mas Broh');
      await googleSignIn.signOut();
    }
    await FirebaseAuth.instance.signOut();
    user = null;
  }
}
