import 'package:flutter/material.dart';
import 'DatabaseInsert.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ViewDatabases.dart';
import 'Pages/AllLeads.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(DatabaseInsert()),
              child: Text("InsertData"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(ViewDatabases()),
              child: Text("View Databases"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(AllLeads()),
              child: Text("AllLeads"),
            ),
          ],
        ),
      ),
    );
  }
}
