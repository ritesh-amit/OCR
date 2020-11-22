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

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;

  const ControlsWidget({
    @required this.onClickedPickImage,
    @required this.onClickedScanText,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: SizeConfig.screenHeight * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffC80815),
            ),
            child: MaterialButton(
              elevation: 10,
              onPressed: onClickedPickImage,
              child: Text('Pick Image',
                 style: GoogleFonts.montserrat(
                    textStyle:TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: SizeConfig.b * 4.4)),
            
                  )
            )),
        Container(
            height: SizeConfig.screenHeight * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xff2E3842),
            ),
            child: MaterialButton(
              elevation: 10,
              onPressed: onClickedScanText,
              child: Text('Scan For Text',
                  style: GoogleFonts.montserrat(
                    textStyle:TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: SizeConfig.b * 4.4)),
            
                  )
                  )
            ),
        Container(
            height: SizeConfig.screenHeight * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffC80815),
            ),
            child: MaterialButton(
              elevation: 10,
              onPressed: onClickedClear,
              child: Text('Clear',
                  style: GoogleFonts.montserrat(
                    textStyle:TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: SizeConfig.b * 4.4)),
            
                  )
            )
            ),
      ],
    );
  }
}
