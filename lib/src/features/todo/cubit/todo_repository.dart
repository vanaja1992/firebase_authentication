import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication/src/core/helpers/authentication_helpers.dart';
import 'package:firebase_authentication/src/features/todo/model/todo_model.dart';

class TodoRepository {
  addTodoList(TodoModel todoModel) async {
    try {
      //String token = "token/";
      //String? userId = await AuthenticationHelper().getUserId();
      CollectionReference todolistCollection = FirebaseFirestore.instance.collection('token');
      todolistCollection.add(todoModel.toJson());
      return true;
    } catch (ex) {
      return false;
    }
  }
}
