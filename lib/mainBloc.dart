import 'package:guess_birthday/date_service.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc {
  
  static final MainBloc instance = MainBloc._();
  BehaviorSubject<MainPageDataObj> _mainPageData = BehaviorSubject();
  Observable<MainPageDataObj> get data$ => _mainPageData.stream;
  double screenHeight;
  Map guessDesc = {1: 'First', 2: 'Second', 3: 'Third', 4: 'Fourth', 5: 'Fifth',
    6: 'Sixth', 7: 'Seventh', 8: 'Eighth', 9: 'Ninth'};
  int guessNum;
  int low;
  int high;
  int guess;
  List<StepTraceObj> stepTrace;
  
  MainBloc._() {
    _setInitialValues();
    _makeGuess();
  }
  
  void _setInitialValues() {
    this.guessNum = 0;
    this.low = 1;
    this.high = 366;
    this.stepTrace = [];
  }
  
  void _makeGuess() {
    if (this.low > this.high) {
      _send(MainPageDataObj(error: this.stepTrace));
    } else {
      this.guessNum += 1;
      this.guess = (this.low + this.high) ~/ 2;
      var dataObj = MainPageDataObj(guessDesc: this.guessDesc[this.guessNum],
          guessDate: DateService.dayToDate(guess));
      _send(dataObj);
    }
  }
  
  void _send(MainPageDataObj data) {
    this._mainPageData.sink.add(data);
  }
  
  void _recordResponse(String response) {
    var traceObj = StepTraceObj(low: low, high: high, guess: guess, response: response);
    this.stepTrace.add(traceObj);
  }
  
  void before() {
    _recordResponse(UserResponse.BEFORE);
    this.high = this.guess - 1;
    _makeGuess();
  }
  
  void after() {
    _recordResponse(UserResponse.AFTER);
    this.low = this.guess + 1;
    _makeGuess();
  }
  
  void correct() {
    var dataObj = MainPageDataObj(guessDate: DateService.dayToDate(guess), correct: true);
    this._mainPageData.sink.add(dataObj);
  }
  
  void reset() {
    _setInitialValues();
    _makeGuess();
  }
  
  void dispose() {
    _mainPageData.close();
  }
  
}

class MainPageDataObj {
  
  String guessDesc;
  String guessDate;
  bool correct;
  List error;
  
  MainPageDataObj({this.guessDesc, this.guessDate, this.correct = false, this.error});

}

class StepTraceObj {
  
  int low;
  int high;
  int guess;
  String response;
  
  StepTraceObj({this.low, this.high, this.guess, this.response});
  
}

class UserResponse {
  static const String BEFORE = 'Before';
  static const String AFTER = 'After';
}

