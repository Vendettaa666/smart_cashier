import 'package:flutter/material.dart';
import 'package:smartcashier/screens/auth/login_screen.dart';

void main() {
  runApp(const SmartCashier());
}

class SmartCashier extends StatelessWidget {
  const SmartCashier({super.key});

  // This widget is the root of your application.
    @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
