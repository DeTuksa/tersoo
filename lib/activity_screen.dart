import 'package:flutter/material.dart';
import 'package:terso_cpm/app_strings.dart';
import 'package:terso_cpm/input_widget.dart';
import 'package:terso_cpm/screen_size.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {

  AnimationController myAnimation;
  List<Widget> inputWidgets = [
    InputWidget(activitySymbol: 'A',),
    InputWidget(activitySymbol: 'B',),
    InputWidget(activitySymbol: 'C',),
  ];

  @override
  void initState() {
    myAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    myAnimation.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    myAnimation.dispose();
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
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    ...inputWidgets,
                    SizedBox(height: 40,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: inputWidgets.length < 10 ? IconButton(
                        icon: Icon(
                          Icons.add
                        ),
                        onPressed: () {
                          addToList();
                        },
                      ) : Material(
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
                    SizedBox(height: 40,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void addToList() {
    if(inputWidgets.length < 10) {
      setState(() {
        inputWidgets.add(
            InputWidget(
              activitySymbol: ACTIVITY_SYMBOLS[inputWidgets.length],
            )
        );
      });
    }
  }
}
