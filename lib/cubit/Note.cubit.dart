import 'package:bloc/bloc.dart';
import 'package:blog/models/Group.model.dart';
import 'package:blog/models/Note.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For json encode & decode

class NoteCubit extends Cubit<List<Note>> {
  SharedPreferences? prefs;

  NoteCubit() : super([]) {
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    getNotes(); // Load notes from SharedPreferences
  }

  void clear() async {
    emit([]);
  }

  void getNotes() {
    final String storedData = prefs!.getString('notes') ?? '[]';
    final List<dynamic> jsonData = json.decode(storedData);
    final List<Note> loadedNotes = jsonData.map((jsonItem) => Note.fromJson(jsonItem)).toList();

    emit(loadedNotes);
  }

  void add(Note note) {
    final currentState = List<Note>.from(state);
    currentState.add(note);
    emit(currentState);
    _saveToPrefs();
  }

  void update(Note note) {
    final currentState = List<Note>.from(state);
    final index = currentState.indexWhere((element) => element.id == note.id);
    if (index != -1) {
      currentState[index] = note;
      emit(currentState);
      _saveToPrefs();
    }
  }

  void delete(Note note) {
    final currentState = List<Note>.from(state);
    currentState.removeWhere((element) => element.id == note.id);
    emit(currentState);
    _saveToPrefs();
  }

  void removeFromGroup(Note note, Group group) {
    final currentState = List<Note>.from(state);
    final index = currentState.indexWhere((element) => element.id == note.id);
    if (index != -1) {
      currentState[index].removeGroup(group);
      emit(currentState);
      _saveToPrefs();
    }
  }

  void removeGroup(Group group) {
    final currentState = List<Note>.from(state);
    for (var note in currentState) {
      note.removeGroup(group);
    }
    emit(currentState);
    _saveToPrefs();
  }

  void _saveToPrefs() {
    final String jsonData = json.encode(state.map((note) => note.toJson()).toList());
    prefs!.setString('notes', jsonData);
  }

}
