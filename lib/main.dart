import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/main.dart';
import 'package:get/get.dart';
import 'package:notes/screens/edit_screen.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/screens/input_screen.dart';
import 'package:notes/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
 class MyApp extends StatelessWidget {


   @override
   Widget build(BuildContext context) {
     return GetMaterialApp(

    initialRoute: MyRoutes.homeRoute,
    routes: {
      MyRoutes.homeRoute : (context) => HomeScreen(),
      MyRoutes.inputRoute: (context) => InputScreen(),


    },
     );
   }
 }

void accessDataOffline_configure(db) async {
  // [START access_data_offline_configure_offline_persistence]
  // Apple and Android
  db.settings = const Settings(persistenceEnabled: false);

  // // Web
  // await db
  //     .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
  // // [END access_data_offline_configure_offline_persistence]
}

