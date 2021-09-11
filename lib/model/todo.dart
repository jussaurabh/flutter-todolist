class Todo {
  String title;
  String detail;

  Todo(this.title, this.detail);

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        detail = json['detail'];

  Map<String, String> toJson() => {
        'title': title,
        'detail': detail,
      };
}
