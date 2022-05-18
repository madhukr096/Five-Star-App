import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_star/models/user_models.dart';

class UserServices {
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> creteToUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection(collection).doc(id).set(values);
  }

  Future<void> updateUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection(collection).doc(id).set(values);
  }

  Future<void> getUserById(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection(collection).doc(id).get().then((doc) {
      if (doc.data() == null) {
        return null;
      }

      return Usermodel.fromSnapShot(doc);
    });
  }
}
