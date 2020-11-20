import 'package:flutter/material.dart';
import 'package:sudoku_solver/layout/keypad_cell.dart';

class KeyPad extends StatelessWidget {

  final int numRow = 2;
  final int numColumn = 5;

  final List<int> activeNumber;

  KeyPad({this.activeNumber});

  List<TableRow> _getTableRows() {
    return List.generate(numRow, (int rowNumber) {
      return TableRow(children: _getRow(rowNumber));
    });
  }

  List<Widget> _getRow(int rowNumber) {
    return List.generate(numColumn, (int columnNumber) {
      return Padding(
        padding: EdgeInsets.all(5),
        child: KeyPadCell(
          number: numColumn * rowNumber + columnNumber,
          activeNumber: this.activeNumber,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
    );
  }
}
