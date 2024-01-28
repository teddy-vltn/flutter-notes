import 'package:blog/cubit/Note.cubit.dart';
import 'package:blog/models/Note.model.dart';
import 'package:blog/ui/widget/BottomModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomNoteModal extends StatelessWidget {
  final Note note;

  final List<Widget> children;

  const BottomNoteModal({
    super.key,
    required this.note,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {

    return BottomModal(
      createdAt: note.createdAt!,
      onDelete: () {
        Navigator.of(context).pop();
        // cubit delete note
        context.read<NoteCubit>().delete(note);
      },
      onEdit: () {
        Navigator.of(context).pop();
        // Go to the edit note page
        GoRouter.of(context).push('/note', extra: note);
      },
      children: children,
    );
  }
}

