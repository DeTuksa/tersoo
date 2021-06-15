import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:terso_cpm/screen_size.dart';

class NumberCard extends StatefulWidget {

  final String lottie;
  final String title;
  final VoidCallback function;

  const NumberCard({
    this.title,
    this.function,
    this.lottie,
    Key key}) : super(key: key);

  @override
  _NumberCardState createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.function,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: width(context) * 0.45,
          height: height(context) * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width(context) * 0.45,
                height: height(context) * 0.2,
                child: Lottie.asset(
                  widget.lottie,
                  fit: BoxFit.contain
                ),
              ),
              SizedBox(height: 15,),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
