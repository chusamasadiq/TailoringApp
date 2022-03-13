import 'package:flutter/material.dart';
import 'package:tailoringapp/screens/register.dart';
import 'package:tailoringapp/screens/sizebox.dart';
import 'package:tailoringapp/screens/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tailoring App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
                CustomeSizedBox(height: 60),
                Image.asset(
                    'assets/images/Clothes.png',
                    fit: BoxFit.cover,
                    scale: 4
                ),
                const Text('Welcome to Tailoring App',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                CustomeSizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                      child: const Text('Login', textScaleFactor: 1.5,)
                  ),
                ),
                CustomeSizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                      child: const Text('Register', textScaleFactor: 1.5,)
                  ),
                ),
                CustomeSizedBox(height: 50),
                Text('Powered By: Ch Usama Sadiq',style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal
                ),)
              ]
          ),
        ),
      ),
    );
  }
}
