import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:medrecords/authentication/authservices.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<bool> createMedicalvisits(
      String doctorName, String purpose, String dateTime, String place) async {
    final userid = await HelperFunction.getUserId();
    try {
      userCollection.doc(userid).collection('medicalvisits').add({
        "doctorName": doctorName,
        "purpose": purpose,
        "dateTime": dateTime,
        "place": place,
        "medicalvisitsId": doctorName + dateTime,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future gettingMedicalvisits() async {
    QuerySnapshot snapshot = await userCollection.doc().collection('medicalvisits').get();
    print(snapshot);
    return snapshot;
  }
}
