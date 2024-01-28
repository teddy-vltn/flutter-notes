import 'package:blog/config/router.dart';
import 'package:blog/cubit/Note.cubit.dart';
import 'package:blog/cubit/Group.cubit.dart'; // Import your TagCubit
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Ensure proper initialization of Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize cubits
  final NoteCubit noteCubit = NoteCubit();
  final GroupCubit groupCubit = GroupCubit();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NoteCubit>.value(
          value: noteCubit,
        ),
        BlocProvider<GroupCubit>.value(
          value: groupCubit,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      routerConfig: router,
    );
  }
}

