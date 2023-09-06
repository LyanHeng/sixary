import 'package:flutter/material.dart';
import 'main.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.title});
  final String title;

  @override
  State<MenuPage> createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  // menu bar
  final double _menuBarRadiusSize = 2;
  final double _menuBarTextFontSize = 17;
  final double _menuBarTextTitleAndBoxDiffSize = 15.0;
  final double _menuBarTextBoxDiffSize = 7.0;

  // body
  final double _bodyTextSize = 30;

  void handleMenuItemSelected(String value) {
    // do something
    if (value == 'homeBoxPressed') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'Sixary')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  // Handle the action for the second menu item
                  handleMenuItemSelected('homeBoxPressed');
                },
                icon: const Icon(Icons.menu),
              ),
              SizedBox(
                width: _menuBarTextTitleAndBoxDiffSize,
              ),
              Text(widget.title),
              SizedBox(
                width: _menuBarTextTitleAndBoxDiffSize,
              ),
              TextButton(
                onPressed: () {
                  // Handle the action for the second menu item
                  handleMenuItemSelected('homeBoxPressed');
                },
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_menuBarRadiusSize)))),
                child: Text("Home",
                    style: TextStyle(fontSize: _menuBarTextFontSize)),
              ),
              SizedBox(
                width: _menuBarTextBoxDiffSize,
              ),
              TextButton(
                onPressed: () {
                  // Handle the action for the second menu item
                  handleMenuItemSelected('aboutBoxPressed');
                },
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_menuBarRadiusSize)))),
                child: Text("About",
                    style: TextStyle(fontSize: _menuBarTextFontSize)),
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => handleMenuItemSelected('aboutBoxPressed'),
              child: Text(
                'Hello',
                style: TextStyle(
                  fontSize: _bodyTextSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
