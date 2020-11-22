import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'ocr_text_detail.dart';
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

class Mobile extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
theme: ThemeData(
fontFamily: 'Montserrat',  
primarySwatch:Colors.red  
),  
debugShowCheckedModeBanner: false,
home: Mobile1(),
);
}
}
class Mobile1 extends StatefulWidget {
@override
_Mobile1State createState() => _Mobile1State();
}

class _Mobile1State extends State<Mobile1> {
int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
bool _autoFocusOcr = true;
bool _torchOcr = false;
bool _multipleOcr = false;
bool _waitTapOcr = false;
bool _showTextOcr = true;
Size _previewOcr;
List<OcrText> _textsOcr = [];
@override
void initState() {
super.initState();
FlutterMobileVision.start().then((previewSizes) => setState(() {
_previewOcr = previewSizes[_cameraOcr].first;
}));
}
@override
Widget build(BuildContext context) {
SizeConfig().init(context);   
return Scaffold(
backgroundColor: Colors.white,  
appBar: AppBar( 
leading: IconButton(
onPressed: () {
Navigator.of(context).push(
MaterialPageRoute(builder: (context) => Home()));
},
icon:Icon(Icons.arrow_back,color:Color(0xff2E3842))
),
backgroundColor: Colors.white,  
elevation:0,  
centerTitle: true,
title: Text('OCR Harbingers',style:
TextStyle(color:Color(0xff2E3842),fontSize: SizeConfig.b*7,
fontWeight: FontWeight.w300,
)),
),
body: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
Colors.white,
Colors.white,
]),
),  
child:_getOcrScreen(context),)
);
}
List<DropdownMenuItem<int>> _getCam() {
List<DropdownMenuItem<int>> cameraItems = [];
cameraItems.add(DropdownMenuItem(
child: Text('Rear',style:TextStyle(fontSize:SizeConfig.b*5)),
value: FlutterMobileVision.CAMERA_BACK,
));
cameraItems.add(DropdownMenuItem(
child: Text('Front',style:TextStyle(fontSize:SizeConfig.b*5)),
value: FlutterMobileVision.CAMERA_FRONT,
));
return cameraItems;
}
List<DropdownMenuItem<Size>> _getPreviewSizes(int facing) {
List<DropdownMenuItem<Size>> previewItems = [];
List<Size> sizes = FlutterMobileVision.getPreviewSizes(facing);
if (sizes != null) {
sizes.forEach((size) {
previewItems.add(
DropdownMenuItem(
child: Text(size.toString(),style:TextStyle(fontSize: SizeConfig.b*4.7)),
value: size,
),
);
});
} else {
previewItems.add(
DropdownMenuItem(
child: Text('Empty'),
value: null,
),
);
}
return previewItems;
}

Widget _getOcrScreen(BuildContext context) {
List<Widget> items = [];
items.add(
Column(children:[
SizedBox(height:SizeConfig.v*2),
Row(
children:[
SizedBox(width:SizeConfig.b*4),  
Text('Camera:',style:TextStyle(fontSize:SizeConfig.b*5.1)),
SizedBox(width:SizeConfig.b*6),
DropdownButton(
isDense: true,  
underline: Container(),  
items: _getCam(),
onChanged: (value) {
_previewOcr = null;
setState(() => _cameraOcr = value);
},
value: _cameraOcr,
),
]),
Row(children:[
SizedBox(width:SizeConfig.b*4),
Text('Preview Size:',style:TextStyle(fontSize:SizeConfig.b*5.1)),
SizedBox(width:SizeConfig.b*6),
DropdownButton(
underline: Container(),  
items: _getPreviewSizes(_cameraOcr),
onChanged: (value) {
setState(() => _previewOcr = value);
},
value: _previewOcr,
),
]),
SizedBox(height:SizeConfig.v*3),
Text('Features',style:TextStyle(fontSize:SizeConfig.b*8,fontWeight: FontWeight.w300)),
SwitchListTile(
activeColor:Color(0xffC80815),  
title:  Text('Auto focus:',style:TextStyle(fontSize:SizeConfig.b*4.8)),
value: _autoFocusOcr,
onChanged: (value) => setState(() => _autoFocusOcr = value),
),
SwitchListTile(
  activeColor: Color(0xff2E3842),
title:  Text('Torch:',style:TextStyle(fontSize:SizeConfig.b*4.8)),
value: _torchOcr,
onChanged: (value) => setState(() => _torchOcr = value),
),
SwitchListTile(
activeColor:Color(0xffC80815),  
title:  Text('Return all texts:',style:TextStyle(fontSize:SizeConfig.b*4.8)),
value: _multipleOcr,
onChanged: (value) => setState(() => _multipleOcr = value),
),
SwitchListTile(
activeColor: Color(0xff2E3842),
title:  Text('Capture when tap screen:',style:TextStyle(fontSize:SizeConfig.b*4.8)),
value: _waitTapOcr,
onChanged: (value) => setState(() => _waitTapOcr = value),
),
SwitchListTile(
activeColor:Color(0xffC80815),  
title:  Text('Show text:',style:TextStyle(fontSize:SizeConfig.b*4.8)),
value: _showTextOcr,
onChanged: (value) => setState(() => _showTextOcr = value),
),
SizedBox(height:SizeConfig.v*1),
Container(
height:SizeConfig.screenHeight*0.05,  
decoration:BoxDecoration(
color:Color(0xffC80815),
borderRadius: BorderRadius.circular(5),
),  
child:MaterialButton(
padding: EdgeInsets.zero,
onPressed: _read,
child: Text('READ',style:TextStyle(color:Colors.white,fontSize:20,fontWeight: FontWeight.w300)),
),
),
SizedBox(height:SizeConfig.v*2.5),
])  
);
items.addAll(
ListTile.divideTiles(
context: context,
tiles: _textsOcr
.map((ocrText) => OcrTextWidget(ocrText),).toList(),
),
);
return ListView(
padding:  EdgeInsets.only(
top: SizeConfig.b*4,
),
children: items,
);
}
Future<Null> _read() async {
List<OcrText> texts = [];
try {
texts = await FlutterMobileVision.read(
flash: _torchOcr,
autoFocus: _autoFocusOcr,
multiple: _multipleOcr,
waitTap: _waitTapOcr,
showText: _showTextOcr,
preview: _previewOcr,
camera: _cameraOcr,
fps: 2.0,
);
} on Exception {
texts.add(OcrText('Failed to recognize text.'));
}
if (!mounted) return;
setState(() => _textsOcr = texts);
}
}

class OcrTextWidget extends StatelessWidget {
final OcrText ocrText;
OcrTextWidget(this.ocrText);
@override
Widget build(BuildContext context) {
return ListTile(
leading:  Icon(Icons.title),
title: SelectableText(ocrText.value),
subtitle: Text(ocrText.language),
trailing:  Icon(Icons.arrow_forward),
onTap: () => Navigator.of(context).push(
MaterialPageRoute(builder: (context) => OcrTextDetail(ocrText),
),
),
);
}
}
