import 'package:first_api_learn/modal/todo_modal.dart';

class DataModal{
  int? limit;
  int? skip;
  int? total;
  List<TodoModal>? todos;

  DataModal({required this.limit,required this.skip,required this.total,required this.todos});



  factory DataModal.fromJson(Map<String,dynamic>Json){
    
    List <TodoModal> allTodoApi=[];
    for(Map<String,dynamic> eachModal in Json["todos"]){
      var vdata=TodoModal.fromJson(eachModal);
      allTodoApi.add(vdata);
    }

    return DataModal(
        limit:Json["limit"],
        skip:Json["skip"],
        total: Json["total"],
        todos: allTodoApi);
  }

}