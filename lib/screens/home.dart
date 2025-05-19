import 'package:flutter/material.dart';
import 'package:flutter_exam/screens/register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Method

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Jam Shopping Mall',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Pacifico',
      ),
    );
  }

  Widget signInButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700, // สีปุ่ม
        foregroundColor: Colors.white, // สีข้อความ
      ),
      onPressed: () {
        // ใส่ฟังก์ชันที่ต้องการทำเมื่อกดปุ่ม
      },
      child: Text('Sign In'),
    );
  }

  Widget signUpButton() {
    return OutlinedButton(
      onPressed: () {
        print('You Click Sign up');

        MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext context) => Register(),
        );
        Navigator.of(context).push(materialPageRoute);
      },
      child: Text('Sign up'),
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[signInButton(), SizedBox(width: 4.0), signUpButton()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.green.shade600],
              radius: 1.0,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                SizedBox(height: 8.0),
                showButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
