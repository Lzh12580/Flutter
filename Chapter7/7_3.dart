import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

// 抽离成一个单独的组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          // 导航条
          appBar: AppBar(title: Text('李志辉20201120283（各种对话框）')),
          // 主体
          body: DialogPage(),
        ),
        theme: ThemeData(primarySwatch: Colors.blue)
    );
  }
}

class DialogPage extends StatefulWidget {

  DialogPage({Key? key}) : super(key: key);
  _DialogPageState createState() => _DialogPageState();

}

class _DialogPageState extends State<DialogPage> {

  // 提示对话框
  _showToastDialog() {
    Fluttertoast.showToast(
        msg: "提示信息",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  // 确认对话框
  _showAlertDialog() async {
    var result = await showDialog(
      // 表示点击灰色背景的时候是否消失弹出框
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("提示信息"),
              content: Text("您确定要删除吗?"),
              actions: <Widget>[
                TextButton(
                  child: Text("取消"),
                  onPressed: () {
                    print("取消");
                    Navigator.pop(context, 'Cancle');
                  },
                ),
                TextButton(
                    child: Text("确定"),
                    onPressed: () {
                      print("确定");
                      Navigator.pop(context, "Ok");
                    }
                )
              ]
          );
        }
    );
    print(result);
  }

  // 选择对话框
  _showSelectDialog() async {
    var result = await showDialog(
      // 表示点击灰色背景的时候是否消失弹出框
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(

              title: Text("选择内容"),
              children: <Widget>[

                SimpleDialogOption(
                  child: Text("Option A"),
                  onPressed: () {
                    print("Option A");
                    Navigator.pop(context, "A");
                  },
                ),

                Divider(),

                SimpleDialogOption(
                  child: Text("Option B"),
                  onPressed: () {
                    print("Option B");
                    Navigator.pop(context, "B");
                  },
                ),

                Divider(),

                SimpleDialogOption(
                  child: Text("Option C"),
                  onPressed: () {
                    print("Option C");
                    Navigator.pop(context, "C");
                  },
                ),

                Divider()

              ]
          );
        }
    );
    print(result);
  }

  // 底部弹出选择框
  _showActionSheetDialog() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 220,
              child: Column(
                  children: <Widget>[
                    ListTile(
                        title: Text("分享 A"),
                        onTap: () {
                          Navigator.pop(context, "分享 A");
                        }
                    ),

                    Divider(),

                    ListTile(
                        title: Text("分享 B"),
                        onTap: () {
                          Navigator.pop(context, "分享 B");
                        }
                    ),

                    Divider(),

                    ListTile(
                        title: Text("分享 C"),
                        onTap: () {
                          Navigator.pop(context, "分享 C");
                        }
                    )
                  ]
              )
          );
        }
    );
    print(result);
  }


  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              ElevatedButton(
                child: Text('提示对话框'),
                onPressed: _showToastDialog,
              ),

              SizedBox(height: 20),

              ElevatedButton(
                child: Text('确认对话框'),
                onPressed: _showAlertDialog,
              ),

              SizedBox(height: 20),

              ElevatedButton(
                child: Text('选择对话框'),
                onPressed: _showSelectDialog,
              ),

              SizedBox(height: 20),

              ElevatedButton(
                child: Text('底部弹出选择框'),
                onPressed: _showActionSheetDialog,
              )

            ]
        )
    );
  }
}