import 'package:flutter/material.dart';

import 'date_service.dart';
import 'mainBloc.dart';

class Widgets {
  
  static MainBloc mainBloc = MainBloc.instance;
  
  static Widget buildGuessWidget({ThemeData theme, String guessDesc, String guessDate}) {
    var buttonColor = theme.buttonColor;
    var buttonTextStyle = theme.textTheme.button;
    var topSpacing = mainBloc.screenHeight > 600 ? mainBloc.screenHeight * .15 : 30.0;
    return Column(
      children: <Widget>[
        SizedBox(height: topSpacing),
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
        SizedBox(height: 80.0),
        startOverButton(theme: theme),
        SizedBox(height: 20.0)
      ],
    );
  }
  
  static Widget buildFireworks({ThemeData theme, String guessDate}) {
    var topSpacing = mainBloc.screenHeight > 600 ? 35.0 : 15.0;
    return Column(
      children: [
        SizedBox(height: topSpacing),
        Image.asset('images/fireworks.gif'),
        SizedBox(height: 25.0),
        Text(guessDate, style: TextStyle(
          fontSize: 45.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Colors.cyanAccent,
        )),
        SizedBox(height: 90.0),
        startOverButton(theme: theme),
        SizedBox(height: 20.0)
      ]
    );
  }
  
  static Widget buildErrorWidget({ThemeData theme, List<StepTraceObj> error}) {
    var topSpacing = mainBloc.screenHeight > 600 ? 25.0 : 15.0;
    return Column(
      children: [
        SizedBox(height: topSpacing),
        Text('Whoops!', style: TextStyle(
          fontSize: 40.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        )),
        SizedBox(height: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: error.map((trace) {
            var guess = DateService.dayToDate(trace.guess);
            var response = trace.response;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('I guessed $guess', style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.cyanAccent,
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('You said $response', style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellowAccent,
                  )),
                )
              ]  
            );
          }).toList(),
        ),
        SizedBox(height: 80.0),
        startOverButton(theme: theme),
        SizedBox(height: 20.0)
      ],
    );
  }
  
  static Widget startOverButton({ThemeData theme}) {
    return FlatButton(
      color: theme.buttonColor,
      child: Text('Start over', style: theme.textTheme.button),
      onPressed: () {
        mainBloc.reset();
      },
    );
  }
  
}
