import 'package:flutter/material.dart';
import 'package:smartcashier/screens/auth/login_screen.dart';
import 'package:smartcashier/screens/auth/register_screen.dart';
import 'package:smartcashier/screens/user/homepage.dart'; // Import yang benar!

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
      title: 'SMART CASHIER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Rute awal aplikasi
      routes: {
        '/': (context) => const LoginScreen(), // LoginScreen di sini
        '/register_screen': (context) => RegisterScreen(), // RegisterScreen di sini
        '/homeuser' : (context) => HomeUser(), // HomeUser di sini
      },
    );
  }
}