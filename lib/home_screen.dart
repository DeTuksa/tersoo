import 'package:flutter/material.dart';
import 'package:terso_cpm/number_card.dart';
import 'package:terso_cpm/screen_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: width(context),
              height: height(context),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Material(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(48),
                    bottomRight: Radius.circular(48)
                ),
                elevation: 8,
                child: Container(
                  width: width(context),
                  height: height(context) * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48)
                    ),
                    color: Colors.blueGrey
                  ),
                  child: Center(
                    child: Text(
                      'Terso\'s CPM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height(context)* 0.1
              ),
              child: ListView(
                children: [
                  SizedBox(height: 20,),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    runAlignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 20,
                    children: [
                      NumberCard(
                        lottie: 'assets/lottie/cpm-3.json',
                        title: 'Calculate for 3 Activity\'s',
                        function: () {
                          Navigator.of(context).pushNamed('three-screen');
                        },
                      ),
                      NumberCard(
                        lottie: 'assets/lottie/cpm-4.json',
                        title: 'Calculate for 4 Activity\'s',
                      ),
                      NumberCard(
                        lottie: 'assets/lottie/cpm-5.json',
                        title: 'Calculate for 5 Activity\'s',
                      ),
                      NumberCard(
                        lottie: 'assets/lottie/cpm-6.json',
                        title: 'Calculate for 6 Activity\'s',
                      ),
                      NumberCard(
                        lottie: 'assets/lottie/cpm-7.json',
                        title: 'Calculate for 7 Activity\'s',
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
