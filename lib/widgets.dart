import 'package:flutter/material.dart';

import 'mainBloc.dart';

class Widgets {
  
  static MainBloc mainBloc = MainBloc.instance;
  
  static Widget buildGuessWidget({String guessDesc, String guessDate, Color buttonColor,
    TextStyle buttonTextStyle}) {
    return Column(
      children: <Widget>[
        Text('$guessDesc Guess',
            style: TextStyle(
              fontSize: 36.0, fontStyle: FontStyle.italic,
            )
        ),
        SizedBox(height: 20.0),
        Text('$guessDate',
          style: TextStyle(
              fontSize: 46.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Color(0xff69f0ae)
          ),
        ),
        SizedBox(height: 45.0),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: buttonColor,
                child: Text('Before', style: buttonTextStyle),
                onPressed: () {
                  mainBloc.before();
                },
              ),
              SizedBox(width: 30.0),
              FlatButton(
                color: buttonColor,
                child: Text('After', style: buttonTextStyle),
                onPressed: () {
                  mainBloc.after();
                },
              )
            ]
        ),
        SizedBox(height: 20.0),
        FlatButton(
          color: buttonColor,
          child: Text('Correct!', style: buttonTextStyle),
          onPressed: () {
            mainBloc.correct();
          },
        ),
      ],
    );
  }
  
  static Widget buildFireworks({String guessDate}) {
    return Text('FIREWORKS!');
  }
  
  static Widget buildErrorWidget({List error}) {
    return Text('ERROR!');
  }
  
}
