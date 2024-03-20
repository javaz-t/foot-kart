import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoe_kart/zzz/firebase_trial.dart';
import 'package:shoe_kart/zzz/firebase_trial_model.dart';

class FirebaseClass {
  FirebaseTrail firebaseTrail =FirebaseTrail();
  static final firebaseInstance =  FirebaseFirestore.instance;
  createTodo({required String title,required String subtitle, required String imageUrl}) async {
    //Reference to document
    final docUser = firebaseInstance.collection('todo').doc();

    final todo = TodoModelClass(
      subtitle:subtitle,
      title: title,
      id: docUser.id,
      imageUrl: imageUrl,
    );
    final json = todo.toFirebase();
    await docUser.set(json);
  }

  Future<void> updateTodo(String documentId, String title, String subtitle,String url) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(documentId).update({
        'title': title, // Update only the title and subtitle fields
        'subtitle': subtitle,
        'imageUrl':url
      });
      print('Document updated successfully!');
    } catch (error) {
      print('Error updating document: $error');
    }
  }

}
