import 'package:flutter/material.dart';

class SudokuCell extends StatefulWidget {
  final int row, col;

  final List<int> activeNumber;
  final List<List<int>> board;

  SudokuCell({this.row, this.col, this.activeNumber, this.board});

  @override
  _SudokuCellState createState() => _SudokuCellState();
}

class _SudokuCellState extends State<SudokuCell> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(() {
          this.widget.board[this.widget.row][this.widget.col] = this.widget.activeNumber[0];
        });
      },
      child: SizedBox(
          height: 40.0,
          child: Container(
            color: Colors.grey[700],
            child: Center(
              child: Text(
                this.widget.board[this.widget.row][this.widget.col] == 0 ?
                  "" : this.widget.board[this.widget.row][this.widget.col].toString(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
