// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medrecords/authentication/authservices.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference medicalvisitsCollection =
      FirebaseFirestore.instance.collection("medicalvisits");

  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "uid": uid,
      "medicalvisits": [],
      "allergies": [],
      "vaccinations": []
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<bool> createMedicalHistory(
      String patientName, String reason, String date) async {
    final userid = await HelperFunction.getUserId();
    log("Creating Medical History");
    try {
      userCollection.doc(userid).collection('medicalHistory').add({
        "patientName": patientName,
        "reason": reason,
        "date": date,
        "medicalId": patientName + reason,
      });
      log("Medical Visit Created");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createMedicalvisits(
      String doctorName, String purpose, String dateTime, String place) async {
    final userid = await HelperFunction.getUserId();
    log("Creating Medical Visit");
    try {
      userCollection.doc(userid).collection('medicalvisits').add({
        "doctorName": doctorName,
        "purpose": purpose,
        "dateTime": dateTime,
        "place": place,
        "medicalvisitsId": doctorName + dateTime,
      });
      log("Medical Visit Created");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createAllergies(
      String allergyName, String allergyDuration, String precautions) async {
    final userid = await HelperFunction.getUserId();
    log("Creating Allergies");
    try {
      userCollection.doc(userid).collection('allergies').add({
        "allergyName": allergyName,
        "allergyDuration": allergyDuration,
        "precautions": precautions,
        "allergiesId": allergyName + allergyDuration,
      });
      log("Medical Visit Created");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createVaccinations(
      String vacciName, String vacciDate, String vacciExp) async {
    final userid = await HelperFunction.getUserId();
    log("Creating Vaccinations");
    try {
      userCollection.doc(userid).collection('vaccinations').add({
        "vacciName": vacciName,
        "vacciDate": vacciDate,
        "vacciExp": vacciExp,
        "allergiesId": vacciName + vacciDate,
      });
      log("Vaccinations Created");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
