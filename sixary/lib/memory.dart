import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'letter.dart';
import 'menu_page.dart';

class MemoryPage extends StatefulWidget {
  const MemoryPage({super.key, required this.title});
  final String title;

  @override
  State<MemoryPage> createState() => MemoryPageState();
}

class MemoryPageState extends State<MemoryPage> {
  // menu bar
  final double _menuBarRadiusSize = 2;
  final double _menuBarTextFontSize = 15;

  // content
  final double _containerPadding = 5.0;
  final List<String> texts = [
    "First Date",
    "First Van's Birthday",
    "First Cooking Date",
    "First Exhibition",
    "First Cafe Date",
    "First ACMI Date",
    "First Movie Date",
    "First Drive Together",
    "First Pro-Photoshoot",
    "First Time Meeting Your Family",
    "First Dinner Out with My Sis",
    "First Hangout with Your Friends",
    "First Time Away From Each Other :(",
    "First Flower for You",
    "First Awarding Ceremony",
    "First Nail Painted :(",
    "First Bubble Snow XD",
    "First Real Snow",
    "And many more to come...",
  ];
  final List<String> images = [
    "assets/images/first_date.jpg",
    "assets/images/van_bd.jpg",
    "assets/images/cooking_date.jpg",
    "assets/images/scienceworks.jpg",
    "assets/images/cafe.jpg",
    "assets/images/acmi.jpg",
    "assets/images/movie.jpg",
    "assets/images/drive.jpg",
    "assets/images/photoshoot.JPG",
    "assets/images/parents.jpg",
    "assets/images/sis_dinner.jpg",
    "assets/images/saboteur.jpg",
    "assets/images/time_away.jpg",
    "assets/images/flower.jpg",
    "assets/images/awarding_ceremony.jpg",
    "assets/images/nail_painted.jpg",
    "assets/images/fake_snow.jpg",
    "assets/images/real_snow.jpg",
    "assets/images/many_more.jpg",
  ];

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

  // generate a set of containers based on the list in the class
  List<Widget> generateContainers() {
    DefaultCacheManager manager = new DefaultCacheManager();
    manager.emptyCache();
    List<Widget> containers = [];
    for (var i = 0; i < texts.length; i++) {
      containers.add(Container(
          margin: const EdgeInsets.all(5.0),
          padding: EdgeInsets.all(_containerPadding),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue),
              borderRadius: BorderRadius.circular(10.0)),
          child: SizedBox(
              height: percentageOfScreenSize(100),
              width: percentageOfScreenSize(80),
              child: Stack(children: <Widget>[
                /*
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(images[i]), fit: BoxFit.cover)),
                ),*/
                Image.asset(
                  images[i],
                  fit: BoxFit.cover,
                  cacheHeight: 500,
                  cacheWidth: 500,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    texts[i],
                    style: GoogleFonts.aboreto(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]))));
    }
    return containers;
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
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: generateContainers(),
            )),
      ),
    );
  }
}
