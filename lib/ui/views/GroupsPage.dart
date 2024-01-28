import 'package:blog/ui/list/GroupListVIew.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        forceMaterialTransparency: true,
        leading: const Icon(
          Icons.tag,
          color: Colors.black,
        ),
        title: Text('Groups'),
      ),
      body: Container(
        color: Colors.white,
        child: GroupListVIew(
          onTap: (group) {
            GoRouter.of(context).push('/group', extra: group);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () {
          // Go to the create group page
          GoRouter.of(context).push('/add-group');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
