import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    "I bet you did not expect this, did you?",
    "Afterall, your guesses were not correct.",
    "Hehehehe XD",
    "I've always wanted to make you an app",
    "And I think this is a good time to do so",
    "You know,",
    "You mean so much to me.",
    "Six months ago, when we met and started dating",
    "I knew then and there I wanted you in my life",
    "And I also knew that I want to be in yours.",
    "So much had happen during these six months",
    "Happiness",
    "Excitement",
    "Silliness",
    "Also some Sadness",
    "But no matter what we always had each other's back",
    "I am very proud of how much we have improved, both ourselves, and us together",
    "And I can't express how much it meant to me for you to be in my life",
    "Thank you for everything love",
    "I love you very much",
    "Very very much",
    "And I hope you know that.",
    "I named this app Sixary",
    "To represents our six months together",
    "The string that ties us are strong",
    "I look forward to the future with you",
    "Let's enjoy our 6th monthiversary together",
    "Happy 6th Monthiversary, my love <3",
  ];
  final List<String> imageList = [
    "assets/images/main/van_scary.jpg",
    "assets/images/main/van_cute.jpg",
    "assets/images/main/van_cute3.jpg",
    "assets/images/main/van_cute5.jpg",
    "assets/images/main/van_cute4.jpg",
    "assets/images/main/van_cute2.jpg",
    "assets/images/main/van_kiss.jpg",
    "assets/images/main/first_date.jpg",
    "assets/images/main/movie.jpg",
    "assets/images/main/movie2.jpg",
    "assets/images/main/van_me_bus.jpg",
    "assets/images/main/happiness.jpg",
    "assets/images/main/excitement.jpg",
    "assets/images/main/van_me_silly.jpg",
    "assets/images/main/sadness.jpg",
    "assets/images/main/back.jpg",
    "assets/images/main/improve.jpg",
    "assets/images/main/shi_chi_lam.jpg",
    "assets/images/main/toys.jpg",
    "assets/images/main/van_kiss_me.jpg",
    "assets/images/main/van_me.jpg",
    "assets/images/main/van_me_2.jpg",
    "assets/images/main/sixary.jpg",
    "assets/images/main/van_drawing.jpg",
    "assets/images/main/string.jpg",
    "assets/images/main/fake_snow.jpg",
    "assets/images/main/goofy.jpg",
    "assets/images/main/piggyback.jpg",
  ];

  void handleMenuItemSelected() {
    if (textList.length == imageList.length) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              textList: textList,
              imageFilePathList: imageList,
              index: 0,
            ),
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
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Dear Vanessa\naka My Baby',
                        style: GoogleFonts.aboreto(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Tap for more',
                        style: GoogleFonts.aboreto(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]))));
  }
}
