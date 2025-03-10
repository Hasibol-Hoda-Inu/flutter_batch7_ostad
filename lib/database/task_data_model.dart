class TaskDataModel{
  int ? id;
  String title;
  int isCompleted;

  TaskDataModel({
    this.id,
    required this.title,
    this.isCompleted = 0
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted
    };
  }

  factory TaskDataModel.fromMap(Map<String, dynamic> map) {
    return TaskDataModel(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted']
    );
  }
}