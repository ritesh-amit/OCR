import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
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

class OcrTextDetail extends StatefulWidget {
final OcrText ocrText;
OcrTextDetail(this.ocrText);
@override
_OcrTextDetailState createState() => _OcrTextDetailState();
}

class _OcrTextDetailState extends State<OcrTextDetail> {
@override
Widget build(BuildContext context) {
SizeConfig().init(context);  
return Scaffold(
appBar: AppBar(
elevation:0,  
leading: IconButton(onPressed: () {
  Navigator.pop(context);
},
icon:Icon(Icons.arrow_back,color:Color(0xff2E3842))
),
backgroundColor: Colors.white,
centerTitle: true,
title:Text('Text Details',style:TextStyle(fontWeight:FontWeight.w300,color:Color(0xffC80815),
fontSize:SizeConfig.b*6 ),
)),
body: ListView(
children: <Widget>[
ListTile(
title: SelectableText(widget.ocrText.value,style:TextStyle(fontWeight:FontWeight.w400,color:Color(0xff2E3842))),
subtitle:Text('Value',style:TextStyle(fontWeight:FontWeight.w300,color:Color(0xffC80815),)),
),
ListTile(
title: Text(widget.ocrText.language),
subtitle: Text('Language',style:TextStyle(fontWeight:FontWeight.w300,color:Color(0xffC80815),)),
),
],
),
);
}
}
