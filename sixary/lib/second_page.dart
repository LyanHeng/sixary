import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage(
      {super.key,
      required this.textList,
      required this.imageFilePathList,
      required this.index});

  // background image
  final List<String> textList;
  final List<String> imageFilePathList;
  final int index;
  final String defaultImagePath = 'assets/images/background.jpg';
  final String defaultText = 'default';

  Route _createRoute(List<String> textList, List<String> imageFilePathList) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(
          textList: textList,
          imageFilePathList: imageFilePathList,
          index: index + 1),
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

  Route _createRouteBack(
      List<String> textList, List<String> imageFilePathList) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(
          textList: textList,
          imageFilePathList: imageFilePathList,
          index: index - 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
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

    void goToPreviousPage(
        List<String> textList, List<String> imageFilePathList) {
      Navigator.of(context).push(_createRouteBack(textList, imageFilePathList));
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
                if (textList.isNotEmpty && index + 1 < textList.length) {
                  goToNextPage(textList, imageFilePathList);
                } else {
                  goToMenu();
                }
              } else if (details.delta.dx > 0) {
                if (textList.isNotEmpty && index - 1 >= 0) {
                  goToPreviousPage(textList, imageFilePathList);
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
                            image: AssetImage(imageFilePathList.isNotEmpty
                                ? imageFilePathList[index]
                                : defaultImagePath),
                            fit: BoxFit.cover)),
                  ),
                  Positioned.fill(
                    left: 2.0,
                    right: 2.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        textList.isNotEmpty
                            ? "\n\n\n\n\n\n\n${textList[index]}"
                            : defaultText,
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
                        'Swipe for more',
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
