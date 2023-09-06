import 'package:flutter/material.dart';
import 'menu_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage(
      {super.key, required this.textList, required this.imageFilePathList});

  // background image
  final List<String> textList;
  final List<String> imageFilePathList;

  Route _createRoute(List<String> textList, List<String> imageFilePathList) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SecondPage(textList: textList, imageFilePathList: imageFilePathList),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void goToNextPage(List<String> textList, List<String> imageFilePathList) {
      Navigator.of(context).push(_createRoute(textList, imageFilePathList));
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
            onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                textList.removeAt(0);
                imageFilePathList.removeAt(0);
                if (textList.isNotEmpty) {
                  goToNextPage(textList, imageFilePathList);
                } else {
                  goToMenu();
                }
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
