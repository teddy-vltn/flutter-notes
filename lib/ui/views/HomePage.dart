import 'package:blog/delegates/NoteSearchDelegate.dart';
import 'package:blog/ui/list/NoteListView.dart';
import 'package:blog/ui/widget/BottomNoteModal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Notes'),
        leading: const Icon(
          Icons.notes,
          color: Colors.black,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // show search bar
              showSearch(
                context: context,
                delegate: NoteSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            NoteListView(
              onLongPress: (note) {
                // Go to the edit note page
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomNoteModal(
                      note: note,
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Go to the create note page
          GoRouter.of(context).push('/add');
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      )
    );
  }
}
