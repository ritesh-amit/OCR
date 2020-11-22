import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_ml_text_recognition/img.dart';
void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: Home(),
);
}
}

class SizeConfig {
static MediaQueryData _mediaQueryData;
static double screenWidth;
static double screenHeight;
static double b;
static double v;

void init(BuildContext context) {
_mediaQueryData = MediaQuery.of(context);
screenWidth = _mediaQueryData.size.width;
screenHeight = _mediaQueryData.size.height;
b = screenWidth / 100;
v = screenHeight / 100;
}
}

class Home extends StatefulWidget {
@override
_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
@override
Widget build(BuildContext context) {
SizeConfig().init(context);
return Scaffold(
appBar: AppBar(
elevation: 0,
title: Text(
'OCR APP',
style: GoogleFonts.quicksand(
textStyle: TextStyle(
color: Color(0xff2E3842),
fontSize: SizeConfig.b * 6,
fontWeight: FontWeight.w800)),
),
centerTitle: true,
backgroundColor: Colors.white,
),
body: Container(
color: Colors.white70,
child: Container(
child: Column(
children: [
SizedBox(
height: SizeConfig.screenHeight * 0.134,
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset(
'images/home2.png',
height: SizeConfig.screenHeight * 0.3361,
width: SizeConfig.screenWidth * 0.728,
)
],
),
SizedBox(height: SizeConfig.screenHeight * 0.235),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
width: SizeConfig.screenWidth * 0.486,
child: Column(
children: [
Text(
'Press the button to start scanning your images',
style: GoogleFonts.montserrat(
textStyle: TextStyle(
color: Colors.grey[300],
fontWeight: FontWeight.w600,
fontSize: SizeConfig.b * 3.5)),
textAlign: TextAlign.center,
),
],
),
)
],
),
SizedBox(
height: SizeConfig.screenHeight * 0.0336,
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children:[
/*FloatingActionButton(
backgroundColor: Color(0xffc80815),
child: Icon(
Icons.camera,
color: Colors.white,
size: SizeConfig.b * 7,
),
onPressed: () {
Navigator.of(context).push(
MaterialPageRoute(builder: (context) => Mobile1()));

},
heroTag: null,
),*/

FloatingActionButton(
backgroundColor: Color(0xff2E3842),
child: Icon(
Icons.copy,
color: Colors.white,
size: SizeConfig.b * 7,
),
onPressed: (){
Navigator.of(context).push(
MaterialPageRoute(builder: (context) => MainPage()));
},
heroTag: null,
),
])
],
)),
),
);
}
}
