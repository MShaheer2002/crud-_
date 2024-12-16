import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/CRUD_BLOC/crud_bloc.dart';
import 'package:untitled3/Screens/create-screen/create_view.dart';
import 'package:untitled3/Screens/delete-screen/delete_view.dart';
import 'package:untitled3/Screens/read-screen/read_view.dart';
import 'package:untitled3/Screens/register-screen/register_view.dart';
import 'package:untitled3/Screens/update-screen/update_view.dart';

import 'Screens/home-screen/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CrudBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const HomeView(),
          "/register-screen": (context) => const RegisterView(),
          // "/home-screen": (context) => const HomeView(),
          "/create-screen": (context) => CreateView(),
          "/read-screen": (context) => const ReadView(),
          "/update-screen": (context) => const UpdateView(),
          "/delete-screen": (context) => const Deleteview(),
        },
      ),
    );
  }
}

