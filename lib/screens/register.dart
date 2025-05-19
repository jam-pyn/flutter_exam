import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String nameString = '';
  String emailString = '';
  String passwordString = '';

  //Method
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print("You Click Upload");
        if (formKey.currentState?.validate() ?? false) {
          formKey.currentState?.save();
          print('Name: $nameString');
          print('Email: $emailString');
          print('Password: $passwordString');
        }
      },
    );
  }

  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        icon: Icon(Icons.face, color: Colors.purple, size: 48.0),
        labelText: 'Display Name :',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type Your Name',
        helperStyle: TextStyle(
          color: Colors.purple,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please fill your name';
        }
        return null;
      },
      onSaved: (String? value) {
        nameString = value?.trim() ?? '';
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        icon: Icon(Icons.email, color: Colors.purple, size: 48.0),
        labelText: 'Email :',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type Your Email',
        helperStyle: TextStyle(
          color: Colors.purple,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!value.contains('@') || !value.contains('.')) {
          return 'Invalid email format';
        }
        return null;
      },
      onSaved: (String? value) {
        emailString = value?.trim() ?? '';
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Colors.purple, size: 48.0),
        labelText: 'Password :',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type Your Password (min 6 characters)',
        helperStyle: TextStyle(
          color: Colors.purple,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String? value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      onSaved: (String? value) {
        passwordString = value?.trim() ?? '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            nameText(),
            SizedBox(height: 16),
            emailText(),
            SizedBox(height: 16),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
