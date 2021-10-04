import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketboxdemo/config/themes/app_color.dart';
import 'package:ticketboxdemo/utils/google_sign_in.dart';
import 'package:ticketboxdemo/views/profile_page.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/login-background.png',
                width: size.width,
              )),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              child: Image.asset(
                'assets/images/background-effect.png',
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColors.PrimaryColor.withOpacity(0.1),
                AppColors.PrimaryColor
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
          ),
          Positioned(
            top: size.height / 2,
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    children: [
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(right: 15),
                                child: ImageIcon(
                                    AssetImage('assets/icon/gg_logo.png'))),
                            Text(
                              'Continue with Google',
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                      RaisedButton(
                  color: Colors.white,
                  onPressed: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child:  ImageIcon(
                      AssetImage('assets/icon/gg_logo.png')
                    )),
                     Text('Go to Profile',
                     style: TextStyle(
                       
                     ),) 
                  ],),
                  
                )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
