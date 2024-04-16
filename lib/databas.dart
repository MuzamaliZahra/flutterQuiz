import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods{

  Future addQuizCategory(
      Map<String ,dynamic> userQuizCategory, String category) async{
    return await FirebaseFirestore.instance
        .collection(category)
        .add(userQuizCategory);

  }

  Future<Stream<QuerySnapshot>> getCategoryQuiz(String category)async{
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }


  Future addUser(String userId, Map<String, dynamic>  userInfoMap){
    return FirebaseFirestore.instance.collection("User").doc(userId).set(userInfoMap);
  }
}



