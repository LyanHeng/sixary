import 'package:flutter/material.dart';
import 'package:sixary/memory.dart';
import 'package:google_fonts/google_fonts.dart';
import 'letter.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.title});
  final String title;

  @override
  State<MenuPage> createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  // menu bar
  final double _menuBarRadiusSize = 0;
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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "",
                          style: GoogleFonts.aboreto(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ]))),
          Container(
              margin: const EdgeInsets.only(bottom: 15.0),
              padding: EdgeInsets.all(_containerPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue),
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                  height: percentageOfScreenSize(90),
                  width: percentageOfScreenSize(80),
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/van_2.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Happy 6th Monthiversary,\nBaby!",
                          style: GoogleFonts.aboreto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ]))),
          Text(
            "Check out my letter\nand some of our first moments babe!",
            style: GoogleFonts.aboreto(
              color: Colors.lightBlue,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
