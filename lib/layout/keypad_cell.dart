import 'package:flutter/material.dart';

class KeyPadCell extends StatelessWidget {
  final int number;

  final List<int> activeNumber;

  KeyPadCell({this.number, this.activeNumber});
  
  @override
  Widget build(BuildContext context) {
    if (number == 0) {
      return SizedBox(
        height: 50.0,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.grey[700],
          ),
          child: OutlineButton(
            onPressed: () {
              this.activeNumber[0] = this.number;
            },
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 50.0,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.grey[700],
          ),
          child: OutlineButton(
            onPressed: () {
              this.activeNumber[0] = this.number;
            },
            child: Text(
              "$number",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      );
    }
  }
}
