import 'package:flutter/material.dart';

import 'SignInPage.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20BA9F),
      appBar: AppBar(
        backgroundColor: Color(0xFF20BA9F),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
          Align(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
              'Forgot password',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
            SizedBox(
              height: 40,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'E-mail'),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Color(0xFF20BA9F), fontSize: 25),
                ),
              ),
            ),
      ],
      ),
      ),
    );
  }
}