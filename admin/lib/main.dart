import 'dart:html';
import 'package:flutter/material.dart';
import 'DatabaseInsert.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    title: "Admin App",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin App"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(DatabaseInsert()),
          child: Text("InsertData"),
        ),
      ),
    );
  }
}
