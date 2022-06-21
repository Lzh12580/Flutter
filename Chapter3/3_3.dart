import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('李志辉20201120283',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        body: IndicatorTest(),
      ),
    );
  }
}

class IndicatorTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[

        Container(
          margin: EdgeInsets.all(20),
          child: LinearProgressIndicator(
            backgroundColor: Colors.blue[200],
            valueColor: AlwaysStoppedAnimation(Colors.yellow),
          ),
        ),

        SizedBox(height: 20,),

        Container(
          margin: EdgeInsets.all(20),
          child: LinearProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.yellow),
            value: 0.8,
          ),
        ),

        SizedBox(height: 20,),

        Container(
          margin: EdgeInsets.all(20),
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.yellow),
          ),
        ),

        SizedBox(height: 20,),

        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(20),
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.yellow),
            value: 0.5,
          ),
        ),
      ],
    );
  }

}