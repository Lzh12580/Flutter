import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  //用户名
  late String userName;

  //密码
  late String password;

  void login() {
    //读取当前 Form 状态
    var loginForm = loginKey.currentState;
    //验证 Form表单
    if (loginForm!.validate()) {
      loginForm.save();
      print('userName：' + userName + '，password：' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('李志辉20201120283'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Form(
              //设置globalKey，用于后面获取FormState
              autovalidateMode: AutovalidateMode.always, key: loginKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '请输入用户名',
                      hintText: "用户名或邮箱",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                    //校验用户
                    validator: (value) {
                      return value!.trim().length > 0 ? null : "用户名不能为空";
                    },
                    //当 Form 表单调用保存方法 Save时回调的函数。
                    onSaved: (value) {
                      userName == value;
                    },
                    // 当用户确定已经完成编辑时触发
                    onFieldSubmitted: (value) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '请输入密码',
                      hintText: '你的登录密码',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    //是否是密码
                    obscureText: true,
                    //校验密码
                    validator: (value) {
                      return value!.length < 6 ? '密码长度不够 6 位' : null;
                    },
                    onSaved: (value) {
                      password == value;
                    },
                  )
                ],
              ),
              //内容改变的回调
              onChanged: () {
                print("onChanged");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "登录",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: login,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

