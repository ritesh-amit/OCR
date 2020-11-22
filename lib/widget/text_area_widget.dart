import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class TextAreaWidget extends StatelessWidget {
final String text;
final VoidCallback onClickedCopy;

TextAreaWidget({
@required this.text,
@required this.onClickedCopy,
Key key,
}) : super(key: key);

@override
Widget build(BuildContext context) {
SizeConfig().init(context);
return SingleChildScrollView(
child: Row(
children: [
Expanded(
child: Container(


decoration: BoxDecoration(
color: Color(0xffE5E5E5),
borderRadius: BorderRadius.circular(SizeConfig.b*2.5),
border: Border.all(color: Color(0xff2E3842))),
padding: EdgeInsets.all(SizeConfig.b*1.13),
alignment: Alignment.center,
child: SelectableText(
text.isEmpty ? 'Scanned Text' : text,
textAlign: TextAlign.center,
style: GoogleFonts.montserrat(
textStyle: TextStyle(fontSize: SizeConfig.b * 4)
)
),
),
),
IconButton(
icon: Icon(Icons.copy, color: Color(0xff305275)),
onPressed: onClickedCopy,
),
],
));
}
}
