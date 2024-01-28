import 'package:blog/config/font.dart';
import 'package:blog/models/Group.model.dart';
import 'package:blog/ui/cards/BaseCard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroupCard extends StatelessWidget {
  final Group group;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color color;

  bool isSelected;

  GroupCard({
    super.key,
    required this.group,
    this.onTap,
    this.onLongPress,
    this.color = Colors.black,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      onLongPress: onLongPress,
      color: color,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
                children: [
                  Icon(group.icon, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(group.name, style: getTextStyleWithColor(TextStyles.h5, Colors.white)),
                  if (group.description.isNotEmpty)
                    Text(group.description, style: getTextStyleWithColor(TextStyles.bodyText1, Colors.white70)),
                ],
              ),
            ),
          ),
          if (isSelected) _buildSelectedIcon(),
        ],
      ),
    );
  }

  Widget _buildSelectedIcon() => const Positioned(
      top: 12,
      right: 12,
      child: Icon(Icons.check_circle, color: Colors.white),
    );
}
