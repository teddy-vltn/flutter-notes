import 'package:blog/ui/widget/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithNavBar extends StatelessWidget {

  const ScaffoldWithNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const SafeArea(
        child: AppBottomNavigationBar(),
      ),
    );
  }
}
