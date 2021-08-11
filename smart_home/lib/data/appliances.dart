import 'dart:core';

class Appliance {
  int userId;
  int id;
  String title;
  bool completed;

  Appliance({this.userId, this.id, this.title, this.completed});

  factory Appliance.fromJson(Map<String, dynamic> json) {
    return Appliance(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
