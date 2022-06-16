import 'package:flutter/material.dart';

void main() => runApp(ClipTestRoute());

class ClipTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("images/avatar.png", width: 60.0);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('裁剪示例程序(李志辉20201120283)'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              avatar, //不剪裁
              ClipOval(child: avatar), //剪裁为圆形
              ClipRRect( //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                  Text("信息学院", style: TextStyle(color: Colors.green),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRect(//将溢出部分剪裁
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5,//宽度设为原来宽度一半
                      child: avatar,
                    ),
                  ),
                  Text("信息学院",style: TextStyle(color: Colors.green))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
