import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class BottomModal extends StatelessWidget {

  final DateTime createdAt;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  final List<Widget> children;

  const BottomModal({
    super.key,
    required this.createdAt,
    required this.onDelete,
    required this.onEdit,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd – kk:mm'); 

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color : Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.black),
            title: const Text('Edit', style: TextStyle(color: Colors.black)),
            onTap: onEdit,
          ),
          const Divider(),
          ...children,
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete', style: TextStyle(color: Colors.red)),
            onTap: onDelete,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Created At: ${dateFormat.format(createdAt)}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
