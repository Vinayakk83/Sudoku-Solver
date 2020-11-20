import 'package:flutter/material.dart';
import 'package:sudoku_solver/layout/sudoku_cell.dart';

class SudokuBoard extends StatelessWidget {

  final List<int> activeNumber;
  final List<List<int>> board;

  SudokuBoard({this.activeNumber, this.board});

  List<TableRow> _getTableRows() {
    return List.generate(9, (int rowNumber) {
      return TableRow(children: _getRow(rowNumber));
    });
  }

  List<Widget> _getRow(int rowNumber) {
    return List.generate(9, (int columnNumber) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: columnNumber % 3 == 2 ? 3.5 : 1.0,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: rowNumber % 3 == 2 ? 3.5 : 1.0,
              color: Colors.black,
            ),
          ),
        ),
        child: SudokuCell(
          row: rowNumber,
          col: columnNumber,
          board: this.board,
          activeNumber: this.activeNumber,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        left: BorderSide(width: 3.5, color: Colors.black),
        top: BorderSide(width: 3.5, color: Colors.black),
      ),
      children: _getTableRows(),
    );
  }
}
