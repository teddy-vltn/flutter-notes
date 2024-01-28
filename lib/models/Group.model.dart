
import 'package:flutter/material.dart';

class Group {
  String id = UniqueKey().toString();
  String name;
  String description;
  Color color;
  IconData icon;

  DateTime? createdAt = DateTime.now();

  Group({
    required String id,
    this.name = "New Group",
    this.description = "New Group Description",
    this.color = Colors.black,
    this.icon = Icons.group,
  }) : id = id.isNotEmpty ? id : UniqueKey().toString();

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'] as String,
      name: json['name'],
      description: json['description'],
      color: Color(json['color'] as int),
      icon: IconData(json['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id != '' ? id : UniqueKey().toString(),
      'name': name,
      'description': description,
      'color': color.value, // Storing color as integer
      'icon': icon.codePoint, // Storing icon as integer
    };
  }


}