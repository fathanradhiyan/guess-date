import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guess_date_app/const/color.dart';
import 'package:guess_date_app/data/card_json.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:guess_date_app/screen/opening_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List itemsTemp = [];
  int itemLength = 0;
  int total = 0;
  bool _visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = card_json;
      itemLength = card_json.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConsts.purple_midnight,
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    CardController controller = CardController(); //Use this to trigger swap.
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _visible = true;
                  });
                },
                elevation: 5,
                color: ColorsConsts.purple_dawn,
                child: Text(
                  'Guess My Number'.toUpperCase(),
                  style: GoogleFonts.mcLaren(
                      color: ColorsConsts.purple_morning, fontSize: 18),
                ),
              ),
              Visibility(
                visible: _visible,
                child: Column(
                  children: [
                    Text(
                      total.toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mcLaren(
                        color: ColorsConsts.purple_morning,
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                        letterSpacing: 3,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OpeningScreen()));
                      },
                      elevation: 5,
                      color: ColorsConsts.purple_dawn,
                      child: Text(
                        'Try Again?'.toUpperCase(),
                        style: GoogleFonts.mcLaren(
                            color: ColorsConsts.purple_morning, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: size.height,
            child: TinderSwapCard(
              orientation: AmassOrientation.BOTTOM,
              allowVerticalMovement: false,
              stackNum: 3,
              totalNum: itemLength,
              maxWidth: size.width * 0.9,
              maxHeight: size.height * 0.9,
              minWidth: size.width * 0.8,
              minHeight: size.height * 0.8,
              cardBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(itemsTemp[index]['img']),
                          fit: BoxFit.contain)),
                ),
              ),
              cardController: controller,
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                var cardValue = itemsTemp[index]['value'];
                if (orientation == CardSwipeOrientation.LEFT) {
                  cardValue = 0;
                  total = total + cardValue;
                } else if (orientation == CardSwipeOrientation.RIGHT) {
                  total = total + cardValue;
                  // print('angka skrg = $total dan arah $orientation');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      color: ColorsConsts.purple_midnight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Text(
          'Swipe Right if Any\nSwipe Left Otherwise',
          textAlign: TextAlign.center,
          style: GoogleFonts.abel(
            color: ColorsConsts.purple_morning,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 3,
          ),
        ),
      ),

    );
  }
}
