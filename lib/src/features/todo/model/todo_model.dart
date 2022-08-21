class TodoModel{
  String title;
   DateTime createdDate;
   DateTime endDate;
   String description;
   TodoStatus todoStatus;

  TodoModel({ required this.title, required this.createdDate, required this.endDate,  required this.description,
    required this.todoStatus});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json["title"],
      createdDate: DateTime.parse(json["createdDate"]),
      endDate: DateTime.parse(json["endDate"]),
      description: json["description"],
      todoStatus: json["todoStatus"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "createdDate": createdDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "description": description,
      "todoStatus": todoStatus,
    };
  }
//

}

enum TodoStatus{todo, inProgress, done, cancelled}