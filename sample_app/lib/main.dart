import 'package:flutter/material.dart';
import 'package:adaptive_codabee_copy_vX/adaptive_codabee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
        string: "Test Adaptive",
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Adaptive.text(string: "${Adaptive.isWeb()}", color: Colors.pink),
              ElevatedButton(onPressed: ()=> Adaptive.alert(context: context), child: Adaptive.text(string: "Press me"))
            ],
          )
        ),
    );
  }
}
