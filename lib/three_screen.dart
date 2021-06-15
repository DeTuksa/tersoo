import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:terso_cpm/input_widget.dart';
import 'package:terso_cpm/models/activity_model.dart';
import 'package:terso_cpm/screen_size.dart';

class ThreeScreen extends StatefulWidget {
  const ThreeScreen({Key key}) : super(key: key);

  @override
  _ThreeScreenState createState() => _ThreeScreenState();
}

class _ThreeScreenState extends State<ThreeScreen> with SingleTickerProviderStateMixin {

  TextEditingController firstActivityName = TextEditingController();
  TextEditingController firstActivityDuration = TextEditingController();
  TextEditingController firstActivityPrecedents = TextEditingController();
  TextEditingController firstActivitySymbol = TextEditingController();

  TextEditingController secondActivityName = TextEditingController();
  TextEditingController secondActivityDuration = TextEditingController();
  TextEditingController secondActivityPrecedents = TextEditingController();
  TextEditingController secondActivitySymbol = TextEditingController();

  TextEditingController thirdActivityName = TextEditingController();
  TextEditingController thirdActivityDuration = TextEditingController();
  TextEditingController thirdActivityPrecedents = TextEditingController();
  TextEditingController thirdActivitySymbol = TextEditingController();

  Activity firstActivity = Activity();
  Activity secondActivity = Activity();
  Activity thirdActivity = Activity();

  AnimationController myAnimation;

  @override
  void initState() {
    myAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    myAnimation.forward();
    firstActivitySymbol.text = 'A';
    secondActivitySymbol.text = 'B';
    thirdActivitySymbol.text = 'C';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height(context),
            width: width(context),
            color: Colors.blue[300],
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 40, left: 12, right: 12
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.menu_arrow,
                        progress: myAnimation,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Input Parameters',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 60,)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height(context) * 0.15),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Container(
                height: height(context),
                width: width(context),
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                child: Consumer<ActivityModel>(
                  builder: (context, activityModel, _) {
                    return ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(height: 40,),
                        InputWidget(
                          nameController: firstActivityName,
                          activitySymbol: firstActivitySymbol.text,
                          durationController: firstActivityDuration,
                          presController: firstActivityPrecedents,
                        ),
                        InputWidget(
                          nameController: secondActivityName,
                          activitySymbol: secondActivitySymbol.text,
                          durationController: secondActivityDuration,
                          presController: secondActivityPrecedents,
                        ),
                        InputWidget(
                          nameController: thirdActivityName,
                          activitySymbol: thirdActivitySymbol.text,
                          durationController: thirdActivityDuration,
                          presController: thirdActivityPrecedents,
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () async {
                              activityModel.collectActivities(
                                  firstActivityName.text, firstActivitySymbol.text, firstActivityDuration.text, firstActivityPrecedents.text,
                                  secondActivityName.text, secondActivitySymbol.text, secondActivityDuration.text, secondActivityPrecedents.text,
                                  thirdActivityName.text, thirdActivitySymbol.text, thirdActivityDuration.text, thirdActivityPrecedents.text);
                              await activityModel.activityPresSplit();
                              await activityModel.threeActivitiesDecision();
                              showBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(36),
                                        topLeft: Radius.circular(36)
                                    ),
                                  ),
                                  builder: (context) {
                                    return Container(
                                      height: height(context) * 0.95,
                                      width: width(context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(36),
                                          topLeft: Radius.circular(36)
                                        ),
                                        color: Colors.white
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.cancel
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 40,),
                                          Lottie.asset(
                                            'assets/lottie/good-job.json',
                                            fit: BoxFit.contain,
                                            repeat: false,
                                            reverse: false
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            'Critical Part is:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              fontSize: 20
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Text(
                                            '${activityModel.finalDuration}',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                              );
                              showAlertDialog(context);
                            },
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                width: width(context) * 0.3,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.blue[300]
                                ),
                                child: Center(
                                  child: Text(
                                    'Generate table',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40,)
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      content: Consumer<ActivityModel>(
        builder: (context, activityModel, _) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Critical Part is:',
                  style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                    '${activityModel.finalDuration}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
