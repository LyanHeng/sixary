import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sixary'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // contents
  final List<String> textList = [
    'I bet you did not expect this, did you?',
    'XD',
    'Hehehehe',
    ':3',
    'Hahahah',
    'Oops',
    'This is a list of pages',
  ];
  final List<String> imageList = [
    'assets/images/background.jpg',
    'assets/images/background.jpg',
    'assets/images/background.jpg',
    'assets/images/background.jpg',
    'assets/images/background.jpg',
    'assets/images/background.jpg',
    'assets/images/van.jpg',
  ];

  void handleMenuItemSelected() {
    if (textList.length == imageList.length) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SecondPage(textList: textList, imageFilePathList: imageList),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              handleMenuItemSelected();
            },
            child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Hello',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoMono',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]))));
  }
}
