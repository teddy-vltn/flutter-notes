import 'package:blog/config/font.dart';
import 'package:blog/models/Note.model.dart';
import 'package:blog/ui/cards/BaseCard.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color color;

  NoteCard({
    super.key,
    required this.note,
    this.onTap,
    this.onLongPress,
    this.color = Colors.black,
  });

  Widget _buildGroupBadge() {
    // if only one group, show the group icon
    if (note.groups.length == 1) {
      return Icon(note.groups.first.icon, color: Colors.black, size: 11);
    }

    // if more than one group, show the number of groups
    return Text(
      note.groups.length.toString(),
      style: getTextStyleWithColor(TextStyles.h6, Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BaseCard(
          onTap: onTap,
          color: color,
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note.title, style: getTextStyleWithColor(TextStyles.h4, Colors.white)),
                const SizedBox(height: 8),
                if (note.description.isNotEmpty)
                  Text(note.description, style: getTextStyleWithColor(TextStyles.bodyText1, Colors.white70)),
              ],
            ),
          ),
        ),
        if (note.groups.isNotEmpty)
          Positioned(
            top: -4,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white, // Choose a suitable color for the badge
                shape: BoxShape.circle,
              ),
              child: _buildGroupBadge(),
            ),
          ),
      ],
    );
  }
}
