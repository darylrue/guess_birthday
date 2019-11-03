import 'package:flutter/material.dart';
import 'package:guess_birthday/widgets.dart';

import 'mainBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess My Birthday',
      theme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Color(0xff304ffe),
        primaryColor: Color(0xff536dfe),
        buttonColor: Color(0xff8c9eff),
        buttonTheme: ButtonThemeData(
          height: 50.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          buttonColor: Color(0xff8c9eff),
          padding: EdgeInsets.symmetric(horizontal: 22.0),
        ),
        textTheme: TextTheme(
          button: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      ),
      home: MyHomePage(title: 'Guess My Birthday'),
      debugShowCheckedModeBanner: false,
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {

  static MainBloc mainBloc = MainBloc.instance;
  
  @override
  void dispose() {
    mainBloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: mainBloc.data$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                var guessDesc = snapshot.data.guessDesc;
                var guessDate = snapshot.data.guessDate;
                var correct = snapshot.data.correct;
                var error = snapshot.data.error;
                if (correct) {
                  return Widgets.buildFireworks(guessDate: guessDate);
                }
                if (error != null) {
                  return Widgets.buildErrorWidget(error: error);
                }
                return Widgets.buildGuessWidget(
                    guessDesc: guessDesc,
                    guessDate: guessDate,
                    buttonColor: theme.buttonColor,
                    buttonTextStyle: theme.textTheme.button
                );
              }
            ),
            
            SizedBox(height: 100.0),
            FlatButton(
              color: theme.buttonColor,
              child: Text('Start over', style: theme.textTheme.button),
              onPressed: () {
                mainBloc.reset();
              },
            )
          ],
        ),
      ),
    );
  }
  
}
