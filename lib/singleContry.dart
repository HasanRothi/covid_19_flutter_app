import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SingleCountry extends StatefulWidget {
  int position;
  String name,
      totalCase = "Loading..",
      totalDeath = "Loading..",
      totalRecovered = "Loading..",
      totalTests = "Loading..",
      todayCase = "Loading..",
      todayDeath = "Loading..",
      population = "Loading..",
      flag = "Loading..";
  SingleCountry(this.name, this.position);
  @override
  _SingleCountryState createState() => _SingleCountryState();
}

var resBody = "loading the data";

class _SingleCountryState extends State<SingleCountry> {
  getInfo() async {
    String countryName = widget.name;

    Response response =
        await get('https://corona.lmao.ninja/v2/countries/$countryName');
    Map data = jsonDecode(response.body);
    setState(() {
      widget.totalCase = (data['cases']).toString();
      widget.totalDeath = (data['deaths']).toString();
      widget.totalRecovered = (data['recovered']).toString();
      widget.todayCase = (data['todayCases']).toString();
      widget.todayDeath = (data['todayDeaths']).toString();
      widget.totalTests = (data['tests']).toString();
      widget.population = (data['population']).toString();
      Map test = (data['countryInfo']);
      widget.flag = (test['flag']).toString();
    });
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getInfo();
    String tc = widget.totalCase;
    String td = widget.totalDeath;
    String p = widget.population;
    String tt = widget.totalTests;
    String ttd = widget.todayDeath;
    String ttc = widget.todayCase;
    String countryName = widget.name;
    String countryflag = widget.flag;
    int px = widget.position + 1;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$countryName ($px)'),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage('$countryflag'),
              radius: 50,
            ),
            Container(
              child: Text(
                "Today's Case $ttc",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(
              color: Colors.black,
              height: 15.0,
            ),
            Container(
              child: Text(
                "Today's Death $ttd",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(
              color: Colors.black,
              height: 15.0,
            ),
            Container(
              child: Text(
                "Total Case $tc",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 5.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(
              color: Colors.black,
              height: 15.0,
            ),
            Container(
              child: Text(
                "Total Death $td",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 5.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(
              color: Colors.black,
              height: 15.0,
            ),
            Container(
              child: Text(
                "Total Tests $tt",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 5.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(
              color: Colors.black,
              height: 15.0,
            ),
            Container(
              child: Text(
                "Population $p",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 5.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
            )
          ],
        ));
  }
}

// class SingleCountry extends StatelessWidget {
//   final String name;
//   SingleCountry(this.name);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$name'),
//       ),
//     );
//   }
//}
