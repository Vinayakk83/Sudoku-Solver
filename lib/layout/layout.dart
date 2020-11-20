import 'package:flutter/material.dart';
import 'package:sudoku_solver/Layout/keypad.dart';
import 'package:sudoku_solver/Layout/sudoku_board.dart';
import 'package:sudoku_solver/services/sudoku_solver.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  List<int> _activeNumber = [0];
  List<List<int>> _board = List.generate(9, (_) => List.generate(9, (_) => 0));

  final solver = SudokuSolver();
  
  void _resetBoard() {
    this._activeNumber = [0];
    this._board = List.generate(9, (_) => List.generate(9, (_) => 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          "Sudoku Solver",
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
        actions: [
          FlatButton.icon(
            onPressed: () {
              setState(() {
                // reset board
                  _resetBoard();
              });
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: Text(
              "reset",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
        child: Column(
          children: [
            SudokuBoard(activeNumber: _activeNumber, board: _board),
            SizedBox(
              height: 45.0,
            ),
            KeyPad(activeNumber: _activeNumber,),
            SizedBox(
              height: 33.0,
            ),
            RaisedButton(
              color: Colors.grey[800],
              onPressed: () {
                setState(() {
                  // solve sudoku
                  this._board = solver.returnBoard(_board);
                });
              },
              child: Text(
                "Solve",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              elevation: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
