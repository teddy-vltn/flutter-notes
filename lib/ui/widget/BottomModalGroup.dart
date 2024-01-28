
import 'package:blog/cubit/Group.cubit.dart';
import 'package:blog/cubit/Note.cubit.dart';
import 'package:blog/models/Group.model.dart';
import 'package:blog/ui/widget/BottomModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomGroupModal extends StatelessWidget {
  final Group group;

  final List<Widget> children;

  const BottomGroupModal({
    super.key,
    required this.group,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {

    return BottomModal(
      createdAt: group.createdAt!,
      onDelete: () {
        Navigator.of(context).pop();
        // cubit delete note
        context.read<GroupCubit>().delete(group);
        context.read<NoteCubit>().removeGroup(group);

      },
      onEdit: () {
        Navigator.of(context).pop();
        // Go to the edit note page
        GoRouter.of(context).push('/add-group', extra: group);
      },
      children: children,
    );
  }
}

