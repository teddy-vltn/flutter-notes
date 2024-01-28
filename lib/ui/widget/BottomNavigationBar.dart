import 'package:blog/config/router.dart';
import 'package:flutter/material.dart';

const int STANDARD_SCREEN_WIDTH = 360;

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final navBarItemsLength = navBarItems.length;

    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,

      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < navBarItemsLength; i++)
                AppBottomNavigationBarItem(
                  label: navBarItems[i]["label"],
                  icon: navBarItems[i]["icon"],
                  route: navBarItems[i]["route"],
                  onTap: navBarItems[i]["onTap"]
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppBottomNavigationBarItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String route;
  final void Function(BuildContext)? onTap;

  const AppBottomNavigationBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.route,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: 70 * size.width / STANDARD_SCREEN_WIDTH - 10,
      height: size.height,
      child: InkWell(
        onTap: () => onTap != null ? onTap!(context) : Navigator.pushNamed(context, route),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}