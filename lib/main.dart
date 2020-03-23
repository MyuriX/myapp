import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/home/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}
class MyCustomForm extends StatefulWidget {
  @override
  FirstRoute createState() {
    return FirstRoute();
  }
}
class FirstRoute extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextFormField emailField;
  TextFormField passwordField;


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            const SizedBox(height: 45.0),
            emailField = TextFormField(
              obscureText: false,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },

              decoration: InputDecoration(
                  hintText: 'username or email',
                  contentPadding: const EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),

              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height :15.0),
            passwordField =TextFormField(
              obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              decoration:InputDecoration(
                hintText: 'password',
                contentPadding: const EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
              )
            ),
            const SizedBox(height: 15.0),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20)
                ),
              ),

      ),
    ]
    )
    );

  }
}


