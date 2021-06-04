import 'package:first_flutter_app/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

String test = "you yo",
    tc = "loading..",
    td = "loading..",
    ttc = "loading..",
    ttd = "loading..";

class _TestState extends State<Test> {
  getWorld() async {
    // Future.delayed(Duration(seconds: 3));
    Response response = await get('https://api.covid19api.com/summary');
    Map data = jsonDecode(response.body);
    setState(() {
      Map x = data['Global'];
      tc = (x['NewConfirmed']).toString();
      td = (x['NewDeaths']).toString();
      ttc = (x['TotalConfirmed']).toString();
      ttd = (x['TotalDeaths']).toString();
      // test = "Lol";
      // test = "lol";
      // Map x = data['Global'];
      // test = x['NewConfirmed'];
      // test = "x";
    });
  }

  @override
  void initState() {
    getWorld();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getWorld();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text('Covid 19 Update'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Today's Case $tc",
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 3.0,
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Divider(
            color: Colors.black,
            height: 20.0,
          ),
          Container(
            child: Text(
              "Today's Death $td",
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 3.0,
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Divider(
            color: Colors.black,
            height: 20.0,
          ),
          Container(
            child: Text(
              "Total Case $ttc",
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 3.0,
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Divider(
            color: Colors.black,
            height: 20.0,
          ),
          Container(
            child: Text(
              "Total Death $ttd",
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 3.0,
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Divider(
            color: Colors.black,
            height: 5.0,
          ),
          Container(
            child: RaisedButton(
              child: Text(
                'View All Country',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
