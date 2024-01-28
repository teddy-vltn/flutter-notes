
import 'package:blog/models/Group.model.dart';
import 'package:blog/models/Note.model.dart';
import 'package:blog/ui/views/GroupCreationPage.dart';
import 'package:blog/ui/views/GroupNotePage.dart';
import 'package:blog/ui/views/HomePage.dart';
import 'package:blog/ui/views/NoteCreationPage.dart';
import 'package:blog/ui/views/GroupsPage.dart';
import 'package:blog/ui/views/SettingsPage.dart';
import 'package:blog/ui/widget/ScaffoldWithNavbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<Map<String, dynamic>> navBarItems = [
  {
    'label': 'Home',
    'icon': Icons.home,
    'route': '/home',
    'onTap': (BuildContext context) {
      GoRouter.of(context).replace('/home');
    },
  },
  {
    'label': 'Groups',
    'icon': Icons.tag,
    'route': '/groups',
    'onTap': (BuildContext context) {
      GoRouter.of(context).replace('/groups');
    },
  },
  {
    'label': 'Settings',
    'icon': Icons.settings,
    'route': '/settings',
    'onTap': (BuildContext context) {
      GoRouter.of(context).replace('/settings');
    },
  },
];

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },

      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/groups',
          builder: (context, state) => const GroupsPage(),
        ),
        GoRoute(
          path: '/add',
          builder: (context, state) => const NoteCreationPage(),
        ),
        GoRoute(
          path: '/note',
          builder: (context, state) {
            final note = state.extra as Note?;
            return NoteCreationPage(note: note);
          }
        ),
        GoRoute(
          path: '/group',
          builder: (context, state) {
            final group = state.extra as Group?;
            return GroupNotePage(group: group!);
          }
        ),
        GoRoute( 
          path: '/add-group',
          builder: (context, state) {
            final group = state.extra as Group?;
            return GroupCreationPage(group: group);
          }
        ),
        GoRoute( 
          path: '/settings',
          builder: (context, state) {
            return SettingsPage();
          }
        )
      ],
    ),

  ],
);