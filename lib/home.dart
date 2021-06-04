import 'package:first_flutter_app/singleContry.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  final String appName = "Covid19 Update info";
  @override
  _HomeState createState() => _HomeState();
}

//All Data/Variables
var resBody = "loading the data";
List<String> countrys = [];
List<String> filtercountrys = countrys;
List<String> countrysFlag = [];
List flags, data;

class _HomeState extends State<Home> {
  getData() async {
    Response response =
        await get('https://corona.lmao.ninja/v2/countries?sort=cases');
    // print(response);
    data = jsonDecode(response.body);
    setState(() {
      String countryName;
      Map individualCountryInfo, flaginfo;
      for (var i = 0; i < data.length; i++) {
        individualCountryInfo = data[i];
        flaginfo = individualCountryInfo['countryInfo'];
        countrysFlag.add(flaginfo['flag']);
        countryName = individualCountryInfo['country'];
        countrys.add(countryName);
      }
    });
  }

  String name = 'COVID19 Update Info';
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text(
            ('$name'),
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        body: new ListView.builder(
            itemCount: countrys.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return ListTile(
                title: Text(
                  countrys[index],
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 3.0,
                  ),
                ),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(countrysFlag[index])),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SingleCountry(countrys[index], index)));
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Toast.show("Developed By - Hasan Rothi", context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          },
          child: Icon(Icons.people),
          backgroundColor: Colors.blue,
        ));
  }
}

// ListView _countryList(BuildContext context) {
//   return ListView.builder(
//     itemCount: 3,
//     itemBuilder: (contrys, index) {
//       return ListTile(
//         title: Text('contrys[$index]'),
//         leading: Icon(Icons.alarm_on),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => SingleCountry("sdk")));
//         },
//       );
//     },
//   );
// }
