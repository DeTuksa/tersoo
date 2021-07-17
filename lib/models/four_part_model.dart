import 'package:flutter/material.dart';
import 'package:terso_cpm/models/activity_model.dart';
import 'dart:core';

class FourPartModel extends ChangeNotifier {
  List firstActPres = [];
  List secondActPres = [];
  List thirdActPres = [];
  List fourthActPres = [];

  Activity firstActivity = Activity();
  Activity secondActivity = Activity();
  Activity thirdActivity = Activity();
  Activity fourthActivity = Activity();

  int finalDuration = 0;

  String criticalPath = '';

  FourPartModel() {
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
      String fourthName,
      String fourthSymbol,
      String fourthDuration,
      String fourthPres) async {
    firstActivity.activityName = firstName;
    firstActivity.activitySymbol = firstSymbol;
    firstActivity.activityDuration = int.parse(firstDuration);
    firstActivity.activityPrecedent = firstPres;

    secondActivity.activityName = secondName;
    secondActivity.activitySymbol = secondSymbol;
    secondActivity.activityDuration = int.parse(secondDuration);
    secondActivity.activityPrecedent = secondPres;

    thirdActivity.activityName = thirdName;
    thirdActivity.activitySymbol = thirdSymbol;
    thirdActivity.activityDuration = int.parse(thirdDuration);
    thirdActivity.activityPrecedent = thirdPres;

    fourthActivity.activityName = fourthName;
    fourthActivity.activitySymbol = fourthSymbol;
    fourthActivity.activityDuration = int.parse(fourthDuration);
    fourthActivity.activityPrecedent = fourthPres;
    notifyListeners();
  }

  Future<void> activityPresSplit() async {
    if (firstActivity.activityPrecedent != null ||
        firstActivity.activityPrecedent != '')
      firstActPres = firstActivity.activityPrecedent.split(',');
    if (secondActivity.activityPrecedent != null ||
        secondActivity.activityPrecedent != '')
      secondActPres = secondActivity.activityPrecedent.split(',');
    if (thirdActivity.activityPrecedent != null ||
        thirdActivity.activityPrecedent != '')
      thirdActPres = thirdActivity.activityPrecedent.split(',');
    if(fourthActivity.activityPrecedent != null ||
    fourthActivity.activityPrecedent != '')
      fourthActPres = fourthActivity.activityPrecedent.split(',');
    notifyListeners();
  }

  void refresh() {
    finalDuration = 0;
    notifyListeners();
  }

  Future<void> fourActivitiesDecision() async {
    refresh();
    if(firstActPres.length > 0) {
      if(firstActPres.length == 1) {
        if(firstActPres[0] == 'B') {
          //TODO: A+B
          if(secondActPres.length > 0) {
            if(secondActPres.length == 1) {
              if(secondActPres[0] == 'C') {
                finalDuration = firstActivity.activityDuration
                    + secondActivity.activityDuration
                    + thirdActivity.activityDuration
                    + fourthActivity.activityDuration;
                criticalPath = 'A -> B -> C -> D';
                print(finalDuration);
                notifyListeners();
              }
              if(secondActPres[0] == 'D') {
                finalDuration = firstActivity.activityDuration
                    + secondActivity.activityDuration
                    + fourthActivity.activityDuration
                    + thirdActivity.activityDuration;
                criticalPath = 'A -> B -> D -> C';
                notifyListeners();

              }
            } else if (secondActPres.length == 2) {
              if(thirdActivity.activityDuration >= fourthActivity.activityDuration) {
                finalDuration = firstActivity.activityDuration
                    + secondActivity.activityDuration
                    + thirdActivity.activityDuration;
                criticalPath = 'A -> B -> C';
                notifyListeners();
              } else {
                finalDuration = firstActivity.activityDuration
                    + secondActivity.activityDuration
                    + fourthActivity.activityDuration;
                criticalPath = 'A -> B -> D';
                notifyListeners();
              }
            }
          }
        } else if(firstActPres[0] == 'C') {
          //TODO
          if(thirdActPres.length > 0) {
            if(thirdActPres.length == 1) {
              if(thirdActPres[0] == 'B') {
                finalDuration = firstActivity.activityDuration
                    + thirdActivity.activityDuration
                    + secondActivity.activityDuration
                    + fourthActivity.activityDuration;
                print(finalDuration);
                criticalPath = 'A -> C -> B -> D';
                notifyListeners();
              }
              if(thirdActPres[0] == 'D') {
                finalDuration = firstActivity.activityDuration
                    + thirdActivity.activityDuration
                    + fourthActivity.activityDuration
                    + secondActivity.activityDuration;
                criticalPath = 'A -> C -> D -> B';
                notifyListeners();
              }
            } else if (thirdActPres.length == 2) {
              if(secondActivity.activityDuration >= fourthActivity.activityDuration) {
                //
                finalDuration = firstActivity.activityDuration
                    + thirdActivity.activityDuration
                    + secondActivity.activityDuration;
                criticalPath = 'A -> C -> B';
                notifyListeners();
              } else {
                //
                finalDuration = firstActivity.activityDuration
                    + thirdActivity.activityDuration
                    + fourthActivity.activityDuration;
                criticalPath = 'A -> C -> D';
                notifyListeners();
              }
            }
          }
        } else if (firstActPres[0] == 'D') {
          if(fourthActPres.length > 0) {
            if(fourthActPres.length == 1) {
              if(fourthActPres[0] == 'B') {
                finalDuration = firstActivity.activityDuration
                    + fourthActivity.activityDuration
                    + secondActivity.activityDuration
                    + thirdActivity.activityDuration;
                print(finalDuration);
                criticalPath = 'A -> D -> B -> C';
                notifyListeners();
              }
              if(fourthActPres[0] == 'C') {
                finalDuration = firstActivity.activityDuration
                    + fourthActivity.activityDuration
                    + thirdActivity.activityDuration
                    + secondActivity.activityDuration;
                criticalPath = 'A -> D -> C -> B';
                notifyListeners();
              }
            } else if (fourthActPres.length == 2) {
              if(secondActivity.activityDuration >= thirdActivity.activityDuration) {
                finalDuration = firstActivity.activityDuration
                    + fourthActivity.activityDuration
                    + secondActivity.activityDuration;
                criticalPath = 'A -> D -> B';
                notifyListeners();
              } else {
                finalDuration = firstActivity.activityDuration
                    + fourthActivity.activityDuration
                    + thirdActivity.activityDuration;
                criticalPath = 'A -> D -> C';
                notifyListeners();
              }
            }
          }
        }
      } else if (firstActPres.length == 2) {
        if ((firstActPres[0] == 'B' && firstActPres[1] == 'C') ||
            (firstActPres[0] == 'C' && firstActPres[1] == 'B')) {
          // if(secondActivity.activityDuration >= thirdActivity.activityDuration)
            if((secondActPres[0] == 'D') && (
            (secondActivity.activityDuration
            + fourthActivity.activityDuration) >= thirdActivity.activityDuration
            )) {
              finalDuration = firstActivity.activityDuration
                  + secondActivity.activityDuration
                  + fourthActivity.activityDuration;
              criticalPath = 'A -> B -> D';
              notifyListeners();

            }
            else if(secondActivity.activityDuration >= (
            thirdActivity.activityDuration + fourthActivity.activityDuration
            )) {
              finalDuration = firstActivity.activityDuration
                  + secondActivity.activityDuration;
              criticalPath = 'A -> B';
              notifyListeners();
            }
            else if((thirdActPres[0] == 'D') && (
            (thirdActivity.activityDuration
            + fourthActivity.activityDuration) >= secondActivity.activityDuration
            )) {
              finalDuration = firstActivity.activityDuration
                  + thirdActivity.activityDuration
                  + fourthActivity.activityDuration;
              criticalPath = 'A -> C -> D';
              notifyListeners();
              print('This is it....' + '$finalDuration');
            }
            else if(thirdActivity.activityDuration >= (
                secondActivity.activityDuration + fourthActivity.activityDuration
            )) {
              finalDuration = firstActivity.activityDuration
                  + thirdActivity.activityDuration;
              criticalPath = 'A -> C';
              notifyListeners();
            }
        } else if ((firstActPres[0] == 'B' && firstActPres[1] == 'D') ||
            (firstActPres[0] == 'D' && firstActPres[1] == 'B')) {

          if((secondActPres[0] == 'C') && (
              (secondActivity.activityDuration
                  + thirdActivity.activityDuration) >= fourthActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + secondActivity.activityDuration
                + thirdActivity.activityDuration;
            criticalPath = 'A -> B -> C';
            notifyListeners();
          }

          else if(secondActivity.activityDuration >= (
              thirdActivity.activityDuration + fourthActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + secondActivity.activityDuration;
            criticalPath = 'A -> B';
            notifyListeners();
          }

          else if((fourthActPres[0] == 'C') && (
              (thirdActivity.activityDuration
                  + fourthActivity.activityDuration) >= secondActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + thirdActivity.activityDuration
                + fourthActivity.activityDuration;
            criticalPath = 'A -> C -> D';
            notifyListeners();
          }

          else if(fourthActivity.activityDuration >= (
              secondActivity.activityDuration + thirdActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + fourthActivity.activityDuration;
            criticalPath = 'A -> D';
            notifyListeners();
          }
        }
        else if ((firstActPres[0] == 'C' && firstActPres[1] == 'D') ||
            (firstActPres[0] == 'D' && firstActPres[1] == 'C')) {
          if((thirdActPres[0] == 'B') && (
              (secondActivity.activityDuration
                  + thirdActivity.activityDuration) >= fourthActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + secondActivity.activityDuration
                + thirdActivity.activityDuration;
            criticalPath = 'A -> B -> C';
            notifyListeners();
          }

          else if(thirdActivity.activityDuration >= (
              secondActivity.activityDuration + fourthActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + thirdActivity.activityDuration;
            criticalPath = 'A -> C';
            notifyListeners();
          }

          else if((fourthActPres[0] == 'B') && (
              (thirdActivity.activityDuration
                  + fourthActivity.activityDuration) >= secondActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + thirdActivity.activityDuration
                + fourthActivity.activityDuration;
            criticalPath = 'A -> C -> D';
            notifyListeners();
          }

          else if(fourthActivity.activityDuration >= (
              secondActivity.activityDuration + thirdActivity.activityDuration
          )) {
            finalDuration = firstActivity.activityDuration
                + fourthActivity.activityDuration;
            criticalPath = 'A -> D';
            notifyListeners();
          }
        }
      }
    }
  }
}
