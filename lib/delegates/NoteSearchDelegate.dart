import 'package:blog/ui/list/NoteListView.dart';
import 'package:flutter/material.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the AppBar, like a clear button
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clears the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // A leading icon on the left of the AppBar
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Closes the search delegate
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection
    return Padding( 
      padding: const EdgeInsets.all(8.0),
      child: NoteListView(
        query: query,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions while the user types
    // Implement your logic to show suggestions based on the query
    return Container();
  }
}
