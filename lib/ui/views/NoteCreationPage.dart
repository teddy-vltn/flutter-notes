import 'dart:convert';

import 'package:blog/config/quill_configurations.dart';
import 'package:blog/cubit/Note.cubit.dart';
import 'package:blog/models/Group.model.dart';
import 'package:blog/service/Snackbar.service.dart';
import 'package:blog/ui/list/ColorPickerListView.dart';
import 'package:blog/ui/list/GroupListVIew.dart';
import 'package:flutter/material.dart';
import 'package:blog/models/Note.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' show QuillController, QuillEditor, QuillToolbar;



class NoteCreationPage extends StatefulWidget {
  final Note? note;
  final bool isEditing;

  const NoteCreationPage({
    super.key,
    this.note,
  }) : isEditing = note != null;

  @override
  _NoteCreationPageState createState() => _NoteCreationPageState();
}

class _NoteCreationPageState extends State<NoteCreationPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late QuillController _contentController;


  Color _selectedColor = Colors.black;
  List<Group> selectedGroups = [];

  Note? get note => widget.note;

  @override
  void initState() {
    super.initState();
    String initialContent = widget.isEditing && widget.note != null ? widget.note!.content : '[{"insert":"This is a new note\\n"}]';
    _contentController = QuillConfigurations.getController(jsonContent: initialContent);

    if (widget.isEditing && widget.note != null) {
      _selectedColor = widget.note!.color;
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
      selectedGroups = List<Group>.from(widget.note!.groups);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _contentController.dispose();
    super.dispose();
  }


  void _saveNote(BuildContext context) async {
    final String title = _titleController.text;
    final String description = _descriptionController.text;
    // get the content as a json string
    final String content = jsonEncode(_contentController.document.toDelta().toJson());
    

    if (title.isNotEmpty && content.isNotEmpty) {

      // is title too long 
      if (title.length > MAX_TITLE_LENGTH) {
        SnackbarService.showErrorSnackbar(context, message: 'Title is too long');
        return;
      }

      Note note = Note(
        title: title,
        description: description,
        content: content,
        color: _selectedColor,
      );

      note.setGroup(selectedGroups);

      context.read<NoteCubit>().add(
        note
      );

      // After saving the note, you may want to navigate back to the note list view
      Navigator.of(context).pop();

      SnackbarService.showSuccessSnackbar(context, message: 'Note created successfully');

      return;
    }

    SnackbarService.showErrorSnackbar(context, message: 'Please fill all the fields');
  }

  void _updateNote(BuildContext context) {

    String title = _titleController.text;
    String content = _contentController.document.toDelta().toJson().toString();

    if (title.isNotEmpty && content.isNotEmpty) {

      // is title too long 
      if (title.length > MAX_TITLE_LENGTH) {
        SnackbarService.showErrorSnackbar(context, message: 'Title is too long');
        return;
      }

      note!.title = _titleController.text;
      note!.description = _descriptionController.text;
      note!.content = jsonEncode(_contentController.document.toDelta().toJson());
      note!.color = _selectedColor;
      note!.setGroup(selectedGroups);

      // Assuming you have a method in your NoteService to update a note
      context.read<NoteCubit>().update(note!);

      // After saving the note, you may want to navigate back to the note list view
      Navigator.of(context).pop();

      SnackbarService.showSuccessSnackbar(context, message: 'Note updated successfully');

      return;
    }

    SnackbarService.showErrorSnackbar(context, message: 'Please fill all the fields');

  }

  void _pickColor() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ColorPickerWidget(
          onSelectColor: (Color color) {
            setState(() {
              _selectedColor = color;
            });
          },
        );
      },
    );
  }

  void _pickTags() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Assuming you have a list of all groups
       return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {

          return GroupListVIew(
            selectedGroupsId: selectedGroups.map((group) => group.id).toList(),
            onTap: (group) {
              if (selectedGroups.contains(group)) {
                setState(() {
                  selectedGroups.remove(group);
                });
                
              } else {
                setState(() {
                  selectedGroups.add(group);
                });
              }
              // force rebuild of the bottom sheet
              setModalState(() {});
            },
          );
        },
      );
      },
    );      
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit note' : 'New note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.label),
            onPressed: _pickTags, // Tag picker
          ),
          // number of selected tags
          Text(selectedGroups.length.toString()),
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: _pickColor, // Color picker
          ),
          // circle avatar to show the selected color
          CircleAvatar(
            backgroundColor: _selectedColor,
            radius: 5,
          ),
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.green,
            onPressed: () => widget.isEditing ? _updateNote(context) : _saveNote(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
              style: Theme.of(context).textTheme.headline5,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Description',
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            QuillToolbar.simple(
              configurations: QuillConfigurations.getToolbarConfigurations(controller: _contentController),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillConfigurations.getEditorConfigurations(controller: _contentController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
