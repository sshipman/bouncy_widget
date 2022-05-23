import 'package:bouncy_widget/bouncy_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bouncy Widget Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BouncyDemo(title: 'Bouncy Widget'),
    );
  }
}

class BouncyDemo extends StatefulWidget {
  const BouncyDemo({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BouncyDemo> createState() => _BouncyDemoState();
}

class _BouncyDemoState extends State<BouncyDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ElevatedButton.icon(
            icon: Padding(
              // This padding gives the bouncing icon vertical room to move into.
              // Without it, the icon will be clipped.
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Bouncy(
                  // the bounce animation takes 2 seconds total
                  duration: Duration(seconds: 2),
                  // go up by 10 before dropping
                  lift: 10,
                  // 25% of the non-pause cycle is lift, the rest is drop
                  ratio: 0.25,
                  // half of the total cycle is motionless
                  pause: 0.5,
                  child: const Icon(Icons.new_releases_outlined)),
            ),
            label: const Text("It's bouncy!"),
            onPressed: () {}));
  }
}
