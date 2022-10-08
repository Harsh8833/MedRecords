import 'package:cloud_firestore/cloud_firestore.dart';

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
    });
  }

  Future savingUserData1(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future createMedicalvisits(String doctorName, String purpose,
      String dateTime, String place) async {
    DocumentReference medicalvisitsReference =
        await medicalvisitsCollection.add({
      "doctorName": doctorName,
      "purpose": purpose,
      "dateTime": dateTime,
      "place": place,
      "medicalvisitsId": doctorName + dateTime,
    });
    // update the members
    await medicalvisitsReference.update({
      "medicalvisitsId": medicalvisitsReference.id,
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "medicalvisits":
          FieldValue.arrayUnion(["${medicalvisitsReference.id}_$doctorName"])
    });
  }
}
