// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:medrecords/main.dart';

import '../database/database_services.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        await DatabaseServices(uid: user.uid).savingUserData(fullName, email);
        await HelperFunction.saveUserId(user.uid);
        await HelperFunction.saveUserLoggedInStatus(true);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        await HelperFunction.saveUserId(user.uid);
        await HelperFunction.saveUserLoggedInStatus(true);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserEmailSF("");
      await HelperFunction.saveUserNameSF("");
      await HelperFunction.saveUserId("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}

class HelperFunction {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userId = "USERID";
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    return await prefs.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    return await prefs.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    return await prefs.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserId(String uid) async {
    return await prefs.setString(userId, uid);
  }

  static Future<bool?> getUserLoggedInStatus() async {
    return prefs.getBool(userLoggedInKey);
  }

  static Future<String?> getUserId() async {
    return prefs.getString(userId);
  }

  static Future<String?> getUserEmailFromSF() async {
    return prefs.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    return prefs.getString(userNameKey);
  }
}
