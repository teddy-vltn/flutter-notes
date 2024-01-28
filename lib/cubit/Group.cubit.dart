import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:blog/models/Group.model.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import your Group model

class GroupCubit extends Cubit<List<Group>> {
  SharedPreferences? prefs;

  GroupCubit() : super([]) {
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    getGroups();
  }

  void clear() async {
    emit([]);
  }

  void getGroups() {
    final List<String> groupsString = prefs!.getStringList('groups') ?? [];
    final List<Group> groups = groupsString.map((groupString) {
      return Group.fromJson(jsonDecode(groupString));
    }).toList();

    emit(groups);
  }

  void add(Group group) {
    final currentState = List<Group>.from(state);
    currentState.add(group);
    emit(currentState);

    _saveToPrefs(currentState);
  }

  void update(Group updatedGroup) {
    final currentState = List<Group>.from(state);
    final index = currentState.indexWhere((_group) => _group.id == updatedGroup.id);
    if (index != -1) {
      currentState[index] = updatedGroup;
      emit(currentState);
      _saveToPrefs(currentState);
    }
  }

  void delete(Group group) {
    final currentState = List<Group>.from(state);
    currentState.removeWhere((_group) => _group.id == group.id);
    emit(currentState);

    _saveToPrefs(currentState);
  }

  void _saveToPrefs(List<Group> groups) {
    final List<String> groupsString = groups.map((group) {
      return jsonEncode(group.toJson());
    }).toList();

    prefs!.setStringList('groups', groupsString);
  }
}

