import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketboxdemo/utils/google_sign_in.dart';
import 'package:ticketboxdemo/views/home_page.dart';
import 'package:ticketboxdemo/views/onboarding/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:ticketboxdemo/utils/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        home: Scaffold(
          body: HomePage(),
        ),
      ));
}


