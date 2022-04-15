import 'package:flutter/material.dart';
import 'package:flutter_app/LeadInfoPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> _providers =
        new List.generate(_count, (int i) => new ProviderList());
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
                  'Add providers',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          new Container(
            height: 450.0,
            child: new ListView(
              children: _providers,
              scrollDirection: Axis.vertical,
            )
          ),
          new FlatButton(
            onPressed: _addNewProvider,
              child: new Icon(Icons.add),
          ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LeadInfoPage()));
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
  void _addNewProvider() {
    setState(() {
      _count = _count + 1;
    });
  }
}
class ProviderList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _ProviderList();

}


class _ProviderList extends State<ProviderList>{
  @override
  Widget build(BuildContext context){
    return new Container(
      width: 170.0,
        padding: new EdgeInsets.all(5.0),
      child: new Column(children: <Widget>[
        Row(children: [
          Expanded(
            child:
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                    labelText: 'First name'),
              ),

          ),
          Expanded(
            child:
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
                  labelText: 'Last name'),
            )
          )
        ]),
        new TextFormField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 0.0),borderRadius: BorderRadius.circular(10)),
              labelText: 'E-mail'),
        ),
        new Container(
          padding: new EdgeInsets.all(20.0)
        ),
      ]));
  }

}