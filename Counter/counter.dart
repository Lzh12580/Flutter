import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Demo',
      theme:  ThemeData(
        primaryColor: Colors.white,
      ),
      home:  const HomePage(title: '李志辉20201120283'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _counter = 0;
  void _increaseCounter(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
              "images/avatar.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
               Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              const Text(
                  "此乃文本组件！",
                  textAlign: TextAlign.center,
                  style: TextStyle(backgroundColor: Colors.yellow,fontSize: 30)
              ),
               IconButton(
                icon:  Icon(
                  _counter != 0 ? Icons.favorite: Icons.favorite_border,
                  color: Colors.red,
                ),
                iconSize: 100.0,
                onPressed: (){
                  setState(() {
                    _counter = 0;
                  });
                },

              ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        tooltip: 'press',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

    );
  }

}

