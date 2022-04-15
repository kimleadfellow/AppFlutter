import 'package:flutter/material.dart';

import 'main.dart';

class LeadInfoPage extends StatefulWidget {
  @override
  _LeadInfoPage createState() => _LeadInfoPage();
}

class _LeadInfoPage extends State<LeadInfoPage> {
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
                  'Lead info',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(children: [
              Expanded(
                child:
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child:Container(
                      width: 20.0,
                child: TextField(

                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                      labelText: 'First name'),
                ),
                    ),
              ),
              ),
              Expanded(
                  child:
                      Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                        labelText: 'Last name'),
                  )
              ),
              )
            ]),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'E-mail'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'Company'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'Phone number'),
              ),
            ),
            Container(
              height: 150.0,
              child: Padding(

              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              child: TextField(
                style: TextStyle(height: 150.0),
                decoration: InputDecoration(

                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'Additional info'),
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
                child: Text(
                  'Send lead',
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