# Flutter Notes App 

A flutter project to create notes, organize them into group and display them in a list.
This project is not setup for fetching data from a server. It is just a simple project using local storage.

All data is stored using the [shared_preferences](https://pub.dev/packages/shared_preferences) package.

## Features

- Create/Edit notes & organize them into groups

<p float="left">
    <img src="img/create_note.png" alt="drawing" width="200"/>
    <img src="img/note_select_group.png" alt="drawing" width="200"/>
    <img src="img/note_select_color.png" alt="drawing" width="200"/>
</p>

- Text editor with basic formatting

<p float="left">
    <img src="img/text_editor.png" alt="drawing" width="200"/>
</p>

- Display notes/groups in a grid

<p float="left">
    <img src="img/note_grid.png" alt="drawing" width="200"/>
    <img src="img/group_grid.png" alt="drawing" width="200"/>
</p>

- Create/Edit groups

<p float="left">
    <img src="img/create_group.png" alt="drawing" width="200"/>
</p>

- Display notes from a group

<p float="left">
    <img src="img/group_note.png" alt="drawing" width="200"/>
</p>

- Context menu for notes

<p float="left">
    <img src="img/contextual_menu.png" alt="drawing" width="200"/>
    <img src="img/contextual_menu_note_in_group.png" alt="drawing" width="200"/>
</p>

- Context menu for groups

<p float="left">
    <img src="img/contextual_menu_groups.png" alt="drawing" width="200"/>
</p>


## Getting Started

This project is a starting point for a Flutter application.

- Clone the project
- Run `flutter pub get` to install dependencies
- Run `flutter run` to run the app

## Packages used

- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_quill](https://pub.dev/packages/flutter_quill)
- [go_router](https://pub.dev/packages/go_router)

## Architecture

This project uses the [BLoC](https://bloclibrary.dev/#/) pattern to manage state.




