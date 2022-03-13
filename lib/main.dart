import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailoringapp/screens/addrecord.dart';
import 'package:tailoringapp/screens/homepage.dart';
import 'package:tailoringapp/screens/login.dart';
import 'package:tailoringapp/screens/mainhomescreen.dart';
import 'package:tailoringapp/screens/register.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TailoringApp());
}

class TailoringApp extends StatelessWidget {
  const TailoringApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        MainHomeScreen.id: (context) => const MainHomeScreen(),
        AddRecord.id: (context) => const AddRecord()
      },
      theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
