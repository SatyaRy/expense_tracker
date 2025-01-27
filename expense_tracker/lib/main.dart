import 'package:expense_tracker/presentation/home_page/form.dart';
import 'package:expense_tracker/presentation/home_page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "sfpro"),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
     routes: {
      "/form": (context)=>const FormInput()
     }
    );
  }
}
