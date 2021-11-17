import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guess_date_app/const/color.dart';
import 'package:guess_date_app/screen/main_screen.dart';
import 'package:lottie/lottie.dart';

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConsts.purple_midnight,
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    height: 100,
                    image: AssetImage('assets/images/guess_logo.png'),
                  ),
                ),
                Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mcLaren(
                    color: ColorsConsts.purple_morning,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'Think of a date\nI will guess correctly',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abel(
                    color: ColorsConsts.purple_morning,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: LottieBuilder.asset('assets/images/pick_date.json'),
                ),
                Text(
                  'Swipe Right if Any\nSwipe Left Otherwise',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abel(
                    color: ColorsConsts.purple_morning,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                    },
                    elevation: 5,
                    color: ColorsConsts.purple_dawn,
                    child: Text(
                      'Got it, Next'.toUpperCase(),
                      style: GoogleFonts.mcLaren(color: ColorsConsts.purple_morning, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
