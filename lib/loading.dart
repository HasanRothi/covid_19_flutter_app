import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getWait() async {
    // Future.delayed(Duration(seconds: 3));
    Response response =
        await get('https://corona.lmao.ninja/v2/countries?sort=cases');
    Navigator.pushReplacementNamed(context, '/test');
  }

  @override
  void initState() {
    //Navigator.pushReplacementNamed(context, '/test');
    getWait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
