import 'package:flutter/material.dart';
import 'package:gengar_dex/app/local_db/local_db.dart';
import 'package:gengar_dex/app/modules/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDB.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
