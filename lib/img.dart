import 'package:firebase_ml_text_recognition/widget/text_recognition_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_ml_text_recognition/main.dart';
class SizeConfig 
{
static MediaQueryData _mediaQueryData;
static double screenWidth;
static double screenHeight;
static double b;
static double v;

void init(BuildContext context){
_mediaQueryData = MediaQuery.of(context);
screenWidth = _mediaQueryData.size.width;
screenHeight = _mediaQueryData.size.height;
b=screenWidth/100;
v=screenHeight/100;
}
}

class MainPage extends StatefulWidget {
@override
_MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
@override
Widget build(BuildContext context) {
SizeConfig().init(context);  
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
backgroundColor: Colors.white,  
elevation: 0,  
centerTitle: true,
leading: IconButton(
onPressed: () {
Navigator.of(context).push(
MaterialPageRoute(builder: (context) => Home()));
},
icon:Icon(Icons.arrow_back,color:Color(0xff2E3842))
),

title: Text("OCR App",style:GoogleFonts.quicksand(
color:Color(0xff2E3842),
fontWeight: FontWeight.w300,fontSize:SizeConfig.b*7)  
)),
body: 
Padding(
padding: EdgeInsets.all(8),
child: Column(
children: [
SizedBox(height: SizeConfig.v*4),
TextRecognitionWidget(),
SizedBox(height: SizeConfig.v*2.1),
],
),
),
);
}
}