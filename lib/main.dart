import 'package:flutter/material.dart';
import 'setlocation.dart';
import 'setFilter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('위치 설정'),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => Location()));
                  },
                ),
                ElevatedButton(
                  child: Text('필터'),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => Filter()));
                    },
                ),
              ],
            )
        ),
      ),
    );
  }
}
