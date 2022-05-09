import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blowfish_ecb/blowfish_ecb.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter_app/Login.dart';
import 'AddProvidersPage.dart';
import 'ForgotPasswordPage.dart';
import 'SignUpPage.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}



String Blowfish(String password){
  DBCrypt dBCrypt = DBCrypt();
  String hashedPwd = dBCrypt.hashpw(password, dBCrypt.gensalt());
  var isCorrect = new DBCrypt().checkpw(password, hashedPwd);
  return hashedPwd;
}


Future<Login> loginRequest(String email, String password) async {
  var emailRequest = email;
  var password_hash = Blowfish(password);
  var queryParameters={
    'email': emailRequest,
    'password_hash': password_hash,
  };
  var uri = Uri.https('app.leadfellow.dev','/api/login',queryParameters);
  final response = await http.get(uri);
  if (response.statusCode == 200 && response.body.isNotEmpty) {
    return Login.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Login failed');
  }
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  void initState() {
    super.initState();
  }
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void dispose(){
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF20BA9F),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/mobileuiimg.png')),
              ),
            ),

            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Sign in',
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
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'E-mail'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                },
                child: Text(
                  'Forgot Password',

                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  loginRequest(emailController.text, passwordController.text);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Color(0xFF20BA9F), fontSize: 25),
                ),
              ),
            ),
            Align(
              child: FlatButton(
                onPressed: () {

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUpPage()));
                },
                child: Text(
                  'Sign up',

                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    );
  }
}
