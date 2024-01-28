
import 'package:blog/cubit/Group.cubit.dart';
import 'package:blog/models/Group.model.dart';
import 'package:blog/service/Snackbar.service.dart';
import 'package:blog/ui/list/ColorPickerListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// list of icons
final List<IconData> icons = [
  Icons.group,
  Icons.group_add,
  Icons.work,
  Icons.schedule,
  Icons.favorite,
  Icons.school,
  Icons.sports,
  Icons.music_note,
  Icons.movie,
  Icons.book,
  Icons.shopping_cart,
  Icons.local_pizza,
  Icons.local_drink,
  Icons.local_cafe,
  Icons.local_bar,
  Icons.local_dining,
  Icons.local_activity,
  Icons.local_airport,
  Icons.local_atm,
  Icons.local_car_wash,
  Icons.local_convenience_store,
  Icons.local_florist,
  Icons.local_gas_station,
  Icons.local_hospital,
  Icons.local_laundry_service,
  Icons.local_library,
  Icons.local_mall,
  Icons.local_movies,
  Icons.local_offer,
  Icons.local_parking,
  Icons.local_pharmacy,
  Icons.local_phone,
  Icons.local_play,
  Icons.local_post_office,
  Icons.local_printshop,
  Icons.money
];

class GroupCreationPage extends StatefulWidget {
  final Group? group;
  final bool isEditing;

  const GroupCreationPage({
    super.key,
    this.group,
  }) : isEditing = group != null;

  @override
  _GroupCreationPageState createState() => _GroupCreationPageState();
}

class _GroupCreationPageState extends State<GroupCreationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Color _selectedColor = Colors.black;
  IconData _selectedIcon = Icons.group;

  Group? get group => widget.group;

  @override
  void initState() {
    super.initState();

    if (widget.isEditing && widget.group != null) {
      _nameController.text = widget.group!.name;
      _descriptionController.text = widget.group!.description;
      _selectedColor = widget.group!.color;
      _selectedIcon = widget.group!.icon;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveGroup(BuildContext context) {
    final String name = _nameController.text;
    final String description = _descriptionController.text;

    if (name.isNotEmpty) {
      // Create a new Group object
      Group newGroup = Group(
        id : UniqueKey().toString(),
        name: name,
        description: description,
        color: _selectedColor,
        icon: _selectedIcon,
      );

      context.read<GroupCubit>().add(newGroup);

      Navigator.pop(context);

      SnackbarService.showSuccessSnackbar(context, message: 'Group created successfully');

      return;
    }

    SnackbarService.showErrorSnackbar(context, message: 'Please fill all the fields');

  }

  void _updateGroup(BuildContext context) {
    final String name = _nameController.text;
    final String description = _descriptionController.text;

    if (name.isNotEmpty) {
      // Create a new Group object
      group!.name = name;
      group!.description = description;
      group!.color = _selectedColor;
      group!.icon = _selectedIcon;

      context.read<GroupCubit>().update(group!);

      Navigator.pop(context);

      SnackbarService.showSuccessSnackbar(context, message: 'Group updated successfully');

      return;
    }

    SnackbarService.showErrorSnackbar(context, message: 'Please fill all the fields');
  }

  void _pickColor() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ColorPickerWidget(
          onSelectColor: (Color color) {
            setState(() {
              _selectedColor = color;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Group' : 'Add Group'),
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: _pickColor, // Color picker
          ),
          // circle avatar to show the selected color
          CircleAvatar(
            backgroundColor: _selectedColor,
            radius: 5,
          ),

          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.green,
            onPressed: () {
              if (widget.isEditing) {
                _updateGroup(context);
              } else {
                _saveGroup(context);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
              ),
              style: Theme.of(context).textTheme.headline5,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Description',
              ),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
            // icon picker
            const Text('Icon'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (int i = 0; i < icons.length; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIcon = icons[i];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Icon(icons[i], color: _selectedIcon == icons[i] ? Colors.black : Colors.grey),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
