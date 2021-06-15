import 'package:flutter/material.dart';
import 'package:terso_cpm/screen_size.dart';

class InputWidget extends StatefulWidget {

  final String activitySymbol;
  final TextEditingController nameController;
  final TextEditingController symbolController;
  final TextEditingController durationController;
  final TextEditingController presController;

  InputWidget({
    this.activitySymbol,
    this.nameController,
    this.durationController,
    this.presController,
    this.symbolController
  });

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 180,
          width: width(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width(context) * 0.7,
                    child: TextFormField(
                      controller: widget.nameController,
                      decoration: InputDecoration(
                        hintText: 'Activity name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: width(context) * 0.1),
                  Container(
                    width: width(context) * 0.1,
                    child: TextFormField(
                      readOnly: true,
                      initialValue: widget.activitySymbol,
                      decoration: InputDecoration(
                          hintText: 'Activity symbol',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width(context) * 0.4,
                    child: TextFormField(
                      controller: widget.durationController,
                      decoration: InputDecoration(
                        hintText: 'Activity Duration',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        suffixText: 'Days',
                        suffixStyle: TextStyle(color: Colors.black),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: width(context) * 0.1),
                  Container(
                    width: width(context) * 0.4,
                    child: TextFormField(
                      controller: widget.presController,
                      decoration: InputDecoration(
                          hintText: 'Activity Precedents',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
