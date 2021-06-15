import 'package:flutter/material.dart';

class ActivityModel extends ChangeNotifier {
  List firstActPres = [];
  List secondActPres = [];
  List thirdActPres = [];

  Activity firsActivity = Activity();
  Activity secondActivity = Activity();
  Activity thirdActivity = Activity();

  int finalDuration = 0;

  ActivityModel() {
    notifyListeners();
  }

  void collectActivities(
      String firstName,
      String firstSymbol,
      String firstDuration,
      String firstPres,
      String secondName,
      String secondSymbol,
      String secondDuration,
      String secondPres,
      String thirdName,
      String thirdSymbol,
      String thirdDuration,
      String thirdPres,
      ) async {
    firsActivity.activityName = firstName;
    firsActivity.activitySymbol = firstSymbol;
    firsActivity.activityDuration = int.parse(firstDuration);
    firsActivity.activityPrecedent = firstPres;

    secondActivity.activityName = secondName;
    secondActivity.activitySymbol = secondSymbol;
    secondActivity.activityDuration = int.parse(secondDuration);
    secondActivity.activityPrecedent = secondPres;

    thirdActivity.activityName = thirdName;
    thirdActivity.activitySymbol = thirdSymbol;
    thirdActivity.activityDuration = int.parse(thirdDuration);
    thirdActivity.activityPrecedent = thirdPres;
    notifyListeners();
  }

  Future<void> activityPresSplit() async {
    if(firsActivity.activityPrecedent != null
    || firsActivity.activityPrecedent != '')
      firstActPres = firsActivity.activityPrecedent.split(',');
    if(secondActivity.activityPrecedent != null
        || secondActivity.activityPrecedent != '')
      secondActPres = secondActivity.activityPrecedent.split(',');
    if(thirdActivity.activityPrecedent != null
        || thirdActivity.activityPrecedent != '')
      thirdActPres = secondActivity.activityPrecedent.split(',');
    notifyListeners();
  }

  Future<void> threeActivitiesDecision() async {
    if(firstActPres.length > 0) {
      if(firstActPres.length == 1) {
        finalDuration = firsActivity.activityDuration
            + secondActivity.activityDuration
            + thirdActivity.activityDuration;
        notifyListeners();
      } else {
        if (secondActivity.activityDuration >= thirdActivity.activityDuration) {
          finalDuration = firsActivity.activityDuration
              + secondActivity.activityDuration;
          notifyListeners();
        } else {
          finalDuration = firsActivity.activityDuration
              + thirdActivity.activityDuration;
          notifyListeners();
        }
      }
    }
    print(finalDuration);
  }
}

class Activity {
  String activityName;
  String activitySymbol;
  int activityDuration;
  String activityPrecedent;

  Activity(
      {this.activityName,
      this.activitySymbol,
      this.activityDuration,
      this.activityPrecedent});
}
