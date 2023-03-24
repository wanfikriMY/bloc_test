import 'package:bloc_test/wrapper/bloc_wrapper.dart';
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
  late BlocWrapper blocWrapper;

  @override
  void initState() {
    blocWrapper = BlocWrapper.instance;
    blocWrapper.getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder<String>(
        stream: blocWrapper.fetchUserDataController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String userData = snapshot.data!;
            return Text(userData);
          } else {
            return Text("Loading");
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Get User Data',
        child: const Icon(Icons.add_reaction_rounded),
      ),
    );
  }
}
