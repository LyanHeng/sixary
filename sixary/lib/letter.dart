import 'package:flutter/material.dart';
import 'package:sixary/memory.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_page.dart';

class LetterPage extends StatefulWidget {
  const LetterPage({super.key, required this.title});
  final String title;

  @override
  State<LetterPage> createState() => MenuPageState();
}

class MenuPageState extends State<LetterPage> {
  // menu bar
  final double _menuBarRadiusSize = 2;
  final double _menuBarTextFontSize = 15;

  // content
  final double _containerPadding = 5.0;

  double percentageOfScreenSize(int percentage) {
    if (percentage < 0 || percentage > 100) {
      return MediaQuery.of(context).size.width;
    }
    return MediaQuery.of(context).size.width * percentage * 0.01;
  }

  void handleMenuItemSelected(String value) {
    // do something
    if (value == 'myLetterSelected') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const LetterPage(title: 'Sixary')));
    } else if (value == 'ourMemorySelected') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MemoryPage(title: 'Sixary')));
    } else if (value == 'onTitleSelected') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MenuPage(title: 'Sixary')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            children: [
              TextButton(
                onPressed: () {
                  // Handle the action for the second menu item
                  handleMenuItemSelected('onTitleSelected');
                },
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_menuBarRadiusSize)))),
                child: Text(widget.title,
                    style: GoogleFonts.aboreto(
                        fontSize: _menuBarTextFontSize + 5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {
                  // Handle the action for the second menu item
                  handleMenuItemSelected('myLetterSelected');
                },
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_menuBarRadiusSize)))),
                child: Text("My Letter",
                    style: GoogleFonts.aboreto(
                        fontSize: _menuBarTextFontSize,
                        fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {
                  // Handle the action for the second menu item
                  handleMenuItemSelected('ourMemorySelected');
                },
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_menuBarRadiusSize)))),
                child: Text("Our Firsts",
                    style: GoogleFonts.aboreto(
                        fontSize: _menuBarTextFontSize,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )),
      body: Center(
        child: Column(children: <Widget>[
          Container(
              margin: const EdgeInsets.all(30.0),
              padding: EdgeInsets.all(_containerPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  height: percentageOfScreenSize(15),
                  width: percentageOfScreenSize(80),
                  alignment: Alignment.center,
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/opera_house.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ]))),
          Container(
            margin: const EdgeInsets.only(top: 0.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.all(_containerPadding),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              "Happy 6th Monthiversary, babe <3\n\n"
              "Time really flies when we are having a good time. "
              "But at the same time, it also felt like I have known you forever. "
              "These past 6 months have been filled with a lot of memories. "
              "From strangers, to getting to know each other, to dating, "
              "To learning about each other, and to loving each other this much, "
              "We really have come a long way. I can't imagine my life without you at this point.\n\n"
              "Thank you for having been such a big part of my life the past 6 months. "
              "You have taught me love, taught me how much I meant to you, and taught me how much you meant to me."
              "You really are one of a kind and non-replaceable, and I really really hope you know that. "
              "Looking back at these 6 months, I am nothing but happy. "
              "I look forward to creating more memories with you in the future. "
              "I love you very much and I appreciate you very much as well "
              "Thank you again for being in my life.\n\n"
              "Happy 6th Monthiversary, love.\n\n"
              "Lyan :*",
              style: GoogleFonts.aboreto(
                color: Colors.lightBlue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ]),
      ),
    );
  }
}
