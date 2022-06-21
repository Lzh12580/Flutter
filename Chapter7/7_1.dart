import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(StudyWillPopScope());

class StudyWillPopScope extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StudyWillPopScopeState();
  }
}

class StudyWillPopScopeState extends State<StudyWillPopScope>{
  DateTime? lastPressTime;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
         title: Text("李志辉20201120283"),
        ),
      body: Container(
        child: WillPopScope(
          onWillPop: () async {
            if(lastPressTime == null ||DateTime.now().difference(lastPressTime!) > Duration(seconds: 1)){
              //间隔时间大于1秒 则重新赋值
              lastPressTime = DateTime.now();
              Fluttertoast.showToast(msg: "再次点击退出",toastLength: Toast.LENGTH_SHORT);
              return false;
            }
            return true;
          },
          child: Text('1秒内连续按两次返回键退出',
              style: TextStyle(fontSize: 25, color: Colors.black),),

        ),
      ),
      )
    );
  }

}
