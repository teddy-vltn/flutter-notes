import 'package:blog/models/Group.model.dart';
import 'package:flutter/material.dart';

const int MAX_PREVIEW_LENGTH = 250;
const int MAX_TITLE_LENGTH = 20;

const int MAXIMUM_PREVIEW_NEW_LINE = 5;

class Note {
  final String id = UniqueKey().toString();
  String title;
  String description;
  String content;
  final DateTime? createdAt = DateTime.now();

  List<Group> groups = [];
  
  Color color = Colors.black;

  Note({
    String title = 'New Note',
    this.description = 'Basic Note',
    this.content = '',
    this.color = Colors.black,
  }) : groups = [], title = title.length > MAX_TITLE_LENGTH ? '${title.substring(0, MAX_TITLE_LENGTH)}...' : title;
  

  String get preview {

    // check if the content has new line character and count it
    int newLineCount = 0;
    for (int i = 0; i < content.length; i++) {
      if (content[i] == '\n') {
        newLineCount++;
      }
    }

    // if the content has new line character, we will only show the first 3 lines
    if (newLineCount > MAXIMUM_PREVIEW_NEW_LINE) {
      String preview = '';
      int newLineCount = 0;
      for (int i = 0; i < content.length; i++) {
        if (content[i] == '\n') {
          newLineCount++;
        }
        if (newLineCount == MAXIMUM_PREVIEW_NEW_LINE) {
          break;
        }
        preview += content[i];
      }
      return '$preview...';
    }

    if (content.length > MAX_PREVIEW_LENGTH) {
      return '${content.substring(0, MAX_PREVIEW_LENGTH)}...';
    }
    return content;
  }

  void addGroup(Group group) {
    groups.add(group);
  }

  void removeGroup(Group group) {
    groups.remove(group);
  }

  void setGroup(List<Group> groups) {
    this.groups = groups;
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    Note note = Note(
      title: json['title'] ?? 'New Note',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      color: Color(json['color'] ?? Colors.black.value),
    );

    if (json['groups'] != null) {
      final List<dynamic> jsonData = json['groups'];
      final List<Group> loadedGroups = jsonData.map((jsonItem) => Group.fromJson(jsonItem)).toList();
      note.setGroup(loadedGroups);
    }

    return note;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'color': color.value, // Convert the Color object to an integer
      'groups': groups.map((group) => group.toJson()).toList(),
    };
  }

}