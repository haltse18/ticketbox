import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketboxdemo/views/onboarding/login_page.dart';
import 'package:ticketboxdemo/views/profile_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print('im here, login sucess');
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasData){
            print('we have data');
            return ProfilePage();    
          }
          else if (snapshot.hasError){
            return Center(child: Text('Something went wrong'),);
          }
          else {
            return MyLoginPage();
          }
        },
      ));
}
