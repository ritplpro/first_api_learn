import 'dart:convert';

class TodoModal{
  bool? completed;
  int? id;
  String? todo;
  int? userid;

  TodoModal({required this.completed,required this.id,required this.todo,required this.userid});


  factory TodoModal.fromJson(Map<String,dynamic>Json){
    return TodoModal(
        completed: Json["completed"],
        id: Json["id"],
        todo: Json["todo"],
        userid:Json["userid"]);
  }

}