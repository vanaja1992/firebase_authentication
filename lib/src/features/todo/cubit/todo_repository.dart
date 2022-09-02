import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication/src/core/helpers/authentication_helpers.dart';
import 'package:firebase_authentication/src/features/todo/model/todo_model.dart';

class TodoRepository {
  Future<bool> addTodoList(TodoModel todoModel) async {
    try {
      String? userId = await AuthenticationHelper().getUserId();
      CollectionReference todolistCollection = FirebaseFirestore.instance
          .collection('users')
          .doc('$userId')
          .collection('task');
      todolistCollection.add(todoModel.toJson());
      return true;
    } catch (ex) {
      return false;
    }
  }

 Future<bool> updateTodo(TodoModel todoModel,String docId ) async {
    try {
      String? userId = await AuthenticationHelper().getUserId();
      CollectionReference todolistCollection = FirebaseFirestore.instance
          .collection('users')
          .doc('$userId')
          .collection('task');
      todolistCollection.doc(docId).update(todoModel.toJson());
      return true;
    } catch (ex) {
      return false;
    }
  }
  Future<bool> deleteTodo(TodoModel todoModel,String docId ) async {
    try {
      String? userId = await AuthenticationHelper().getUserId();
      CollectionReference todolistCollection = FirebaseFirestore.instance
          .collection('users')
          .doc('$userId')
          .collection('task');
      todolistCollection.doc(docId).delete();
      return true;
    } catch (ex) {
      return false;
    }
  }



  Future<QuerySnapshot?> getTodoList() async {
    try{
      String? userId = await AuthenticationHelper().getUserId();
      CollectionReference todolistCollection = FirebaseFirestore.instance
          .collection('users')
          .doc('$userId')
          .collection('task');
     QuerySnapshot querySnapshot = await todolistCollection.get();
      return querySnapshot;
    }
    catch(ex){
       return null;
    }
  }
}
