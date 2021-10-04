import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketboxdemo/utils/google_sign_in.dart';

class ProfilePage extends StatelessWidget {

  ProfilePage();
  
  @override
  Widget build(BuildContext context) {
    //get userinfo
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Text('Logout'),
          onPressed: (){
            final provider = 
            Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Profile'),
            SizedBox(height: 32,),
            CircleAvatar(
              radius: 40 ,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            Text('Name: ' + user.displayName!),
            Text('Email: ' + user.email!),

          ],
        ),
      ),
    );
  }
}
