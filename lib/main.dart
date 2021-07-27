//import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:morphable_shape/morphable_shape.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toggleStyle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212426),
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),

          //cred like button, emboss effect
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(125),
                color: Color(0xff212426),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.white.withOpacity(0.26),
                    offset: Offset(-10, -10),
                  ),
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black26,
                    offset: Offset(10, 10),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Color(0xff212426).withOpacity(0.2),
                    Color(0xff212426).withOpacity(0.3),
                    Color(0xff212426).withOpacity(0.4),
                    Color(0xff212426).withOpacity(0.5),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              width: 500,
              height: 250,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          //inner shadow while tapping using animated_styled_widget package
          Center(
            child: GestureDetector(
              onTapDown: (TapDownDetails details) {
                setState(() {
                  toggleStyle = !toggleStyle;
                });
              },
              onTapUp: (TapUpDetails details) {
                setState(() {
                  toggleStyle = !toggleStyle;
                });
              },
              child: AnimatedStyledContainer(
                duration: Duration(milliseconds: 100),
                style: toggleStyle
                    ? Style(
                        backgroundDecoration: BoxDecoration(
                          color: Color(0xff212426),
                        ),
                        shapeBorder: RectangleShapeBorder(cornerStyles: RectangleCornerStyles.all(CornerStyle.rounded), borderRadius: DynamicBorderRadius.all(DynamicRadius.circular(100.toPXLength))),
                        childAlignment: Alignment.center,
                        height: 250.toPXLength,
                        width: 500.toPXLength,
                        insetShadows: [
                          ShapeShadow(color: Colors.black.withOpacity(0.12), blurRadius: 10.0, offset: Offset(10, 10)),
                          ShapeShadow(color: Colors.white.withOpacity(0.12), blurRadius: 10.0, offset: Offset(-10, -10)),
                        ],
                      )
                    : Style(
                        shapeBorder: RectangleShapeBorder(cornerStyles: RectangleCornerStyles.all(CornerStyle.rounded), borderRadius: DynamicBorderRadius.all(DynamicRadius.circular(100.toPXLength))),
                        backgroundDecoration: BoxDecoration(
                          color: Color(0xff212426),
                        ),
                        childAlignment: Alignment.center,
                        height: 250.toPXLength,
                        width: 500.toPXLength,
                        shadows: [
                          ShapeShadow(color: Colors.black.withOpacity(0.12), blurRadius: 10.0, offset: Offset(10, 10)),
                          ShapeShadow(color: Colors.white.withOpacity(0.12), blurRadius: 10.0, offset: Offset(-10, -10)),
                        ],
                      ),
                child: Text(
                  "Button",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 50.0,
          ),

          //Inner shadow using morphable_shape package
          DecoratedShadowedShape(
            shape: RectangleShapeBorder(
                borderRadius: DynamicBorderRadius.all(DynamicRadius.circular(
              125.0.toPXLength,
            ))),
            shadows: [],
            child: Container(
              child: Center(child: Text("INNER SHADOW")),
              height: 250,
              width: 500,
            ),
            insetShadows: [
              ShapeShadow(color: Colors.black.withOpacity(0.12), blurRadius: 10.0, offset: Offset(10, 10)),
              ShapeShadow(color: Colors.white.withOpacity(0.12), blurRadius: 10.0, offset: Offset(-10, -10)),
            ],
          ),
        ],
      ),
    );
  }
}
