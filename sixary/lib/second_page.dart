import 'package:flutter/material.dart';
import 'menu_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage(
      {super.key, required this.textList, required this.imageFilePathList});

  // background image
  final List<String> textList;
  final List<String> imageFilePathList;

  @override
  Widget build(BuildContext context) {
    void goToNextPage(List<String> textList, List<String> imageFilePathList) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
                textList: textList, imageFilePathList: imageFilePathList),
          ));
    }

    void goToMenu() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MenuPage(
              title: 'Sixary',
            ),
          ));
    }

    return Scaffold(
        body: GestureDetector(
            onTap: () {
              textList.removeAt(0);
              imageFilePathList.removeAt(0);
              if (textList.isNotEmpty) {
                goToNextPage(textList, imageFilePathList);
              } else {
                goToMenu();
              }
            },
            child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imageFilePathList[0]),
                            fit: BoxFit.cover)),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        textList[0],
                        style: const TextStyle(
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
