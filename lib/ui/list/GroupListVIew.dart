import 'package:blog/cubit/Group.cubit.dart';
import 'package:blog/models/Group.model.dart';
import 'package:blog/ui/cards/GroupCard.dart';
import 'package:blog/ui/widget/BottomModalGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Import your TagCubit

// ignore: must_be_immutable
class GroupListVIew extends StatefulWidget {
  final Function(Group)? onTap;

  List<String> selectedGroupsId;

  GroupListVIew({
    Key? key,
    this.onTap,
    this.selectedGroupsId = const [],
  }) : super(key: key);

  @override
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListVIew> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GroupCubit, List<Group>>(
      builder: (context, Groups) {

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Groups.isEmpty
              ? const Center(child: Text('No Groups available'))
              : MasonryGridView.count( 
                  crossAxisCount: 2,
                  itemCount: Groups.length,
                  itemBuilder: (context, index) {
                    final group = Groups[index];
                    return GroupCard(
                      group: group,
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BottomGroupModal(
                              group: group,
                            );
                          },
                        );
                      },
                      onTap: () {
                        if (widget.onTap != null) {
                          widget.onTap!(group);
                        }
                      },
                      color: group.color,
                      isSelected: widget.selectedGroupsId.contains(group.id),
                    );
                  },
                ),
              );
      },
    );
  }
}
