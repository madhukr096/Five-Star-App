import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Usermodel {
  static const NUMBER = 'number';
  static const ID = 'id';

  String _number = '';
  String _id = '';

  String get number => _number;
  String get id => _id;

  Usermodel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _number = snapshot[NUMBER];
    _id = snapshot[ID];
  }
}
