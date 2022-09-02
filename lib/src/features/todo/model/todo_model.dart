class TodoModel {
  String title;
  DateTime createdDate;
  DateTime endDate;
  String description;
  TodoStatus todoStatus;
  String? todoId;


  TodoModel(
      {required this.title,
      required this.createdDate,
      required this.endDate,
      required this.description,
      required this.todoStatus,
    });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    TodoStatus tempStatus = TodoStatus.todo;
    if(json["todoStatus"].toString() == TodoStatus.todo.toString()){
      tempStatus = TodoStatus.todo;
    }else if(json["todoStatus"].toString() == TodoStatus.inProgress.toString()){
      tempStatus = TodoStatus.inProgress;
    }
    else if(json["todoStatus"].toString() == TodoStatus.done.toString()){
      tempStatus = TodoStatus.done;
    }
    else if(json["todoStatus"].toString() == TodoStatus.cancelled.toString()){
      tempStatus = TodoStatus.cancelled;
    }
    return TodoModel(
      title: json["title"],
      createdDate: DateTime.parse(json["createdDate"]),
      endDate: DateTime.parse(json["endDate"]),
      description: json["description"],
      todoStatus: tempStatus,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "createdDate": createdDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "description": description,
      "todoStatus": todoStatus.toString(),
         };
  }
//


}

enum TodoStatus { todo, inProgress, done, cancelled }
