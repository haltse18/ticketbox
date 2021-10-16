import 'package:flutter/material.dart';

class AppColors{
  static final PrimaryColor = Color(0xFFFFFF);
  static final SecondaryColor = Color(0xC0FFFFFF);

  ThemeData AppTheme(){
    return ThemeData(
        accentColor: Color(0x40DF9F),
        
        primarySwatch: Colors.green,
        fontFamily: 'NunitoSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 52, 52, 1)
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 52, 52, 1)
          ),
          subtitle1: TextStyle(
            fontSize: 18,
            fontFamily: 'NunitoSans',
            color: Colors.white, 
          )
        )
      );
  }
}

