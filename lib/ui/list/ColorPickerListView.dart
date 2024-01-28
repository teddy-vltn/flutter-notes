import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  final void Function(Color) onSelectColor;

  const ColorPickerWidget({Key? key, required this.onSelectColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.count(
        crossAxisCount: 5,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(Colors.primaries.length, (index) {
          return GestureDetector(
            onTap: () {
              onSelectColor(Colors.primaries[index]);
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[index],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
