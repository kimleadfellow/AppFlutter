import 'dart:convert';

import 'package:flutter/material.dart';

import 'LeadInfo.dart';
import 'LeadInfoRequest.dart';
import 'SignInPage.dart';
import 'package:http/http.dart' as http;

class LeadInfoPage extends StatefulWidget {
  @override
  _LeadInfoPage createState() => _LeadInfoPage();
}

Future<LeadInfoRequest> sendLeadInfo(LeadInfo leadinfo) async {
  var token = leadinfo.token;
  var company = leadinfo.company;
  var person_first = leadinfo.person_first;
  var person_last = leadinfo.person_last;
  var phone = leadinfo.phone;
  var phone_area_code = leadinfo.phone_area_code;
  var email = leadinfo.email;
  var info = leadinfo.email;
  var commission = leadinfo.commission;
  var provider_emails = leadinfo.provider_emails;
  var queryParameters={
    'token': token,
    'company': company,
    'person_first': person_first,
    'person_last': person_last,
    'phone': phone,
    'phone_area_code': phone_area_code,
    'email': email,
    'info': info,
    'commission': commission,
    'provider_emails': provider_emails,
  };
  var uri = Uri.https('app.leadfellow.dev','/api/insert-lead',queryParameters);
  final response = await http.get(uri);
  if (response.statusCode == 200 && response.body.isNotEmpty) {
    return LeadInfoRequest.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Lead info sending failed');
  }
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
                    labelText: 'Commission'),
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
              //height: 150.0,
              child: Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                //style: TextStyle(height: 15.0),
                decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(top: 2),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'Additional info'),
              ),
              ),
            ),
            SizedBox(
              height: 35,
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
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}