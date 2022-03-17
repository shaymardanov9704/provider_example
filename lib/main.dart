import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/provider_.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppleProvider(),
          )
        ],
        child:  MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const MyHomePage(title: 'Apple Provider'),
        ));
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
    int numberOfApple = Provider.of<AppleProvider>(context).numberOfApple;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(height: 180,image: AssetImage('assets/apple.png')),
            Text('You have ${numberOfApple.toString()} Apple'),
            ElevatedButton(
                onPressed: () {
                  Provider.of<AppleProvider>(context, listen: false)
                      .addApple(numberOfApple + 1);
                },
                child: const Text('Add an Apple')),
            ElevatedButton(
                onPressed: () {
                  Provider.of<AppleProvider>(context, listen: false)
                      .subtractionApple(numberOfApple - 1);
                },
                child: const Text('Subtraction an Apple'))
          ],
        ),
      )
    );
  }
}
