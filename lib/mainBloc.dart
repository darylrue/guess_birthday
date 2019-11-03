import 'package:guess_birthday/date_service.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc {
  
  static final MainBloc instance = MainBloc._();
  BehaviorSubject<MainPageDataObj> _mainPageData = BehaviorSubject();
  Observable<MainPageDataObj> get data$ => _mainPageData.stream;
  DateService dateService = DateService();
  Map guessDesc = {1: 'First', 2: 'Second', 3: 'Third', 4: 'Fourth', 5: 'Fifth',
    6: 'Sixth', 7: 'Seventh', 8: 'Eighth', 9: 'Ninth'};
  int guessNum;
  int low;
  int high;
  int guess;
  List stepTrace = [];
  
  MainBloc._() {
    _setInitialValues();
    _makeGuess();
  }
  
  void _setInitialValues() {
    this.guessNum = 0;
    this.low = 1;
    this.high = 366;
  }
  
  void _makeGuess() {
    if (this.low > this.high) {
      _send(MainPageDataObj(error: this.stepTrace));
    } else {
      this.guessNum += 1;
      this.guess = (this.low + this.high) ~/ 2;
      var dataObj = MainPageDataObj(guessDesc: this.guessDesc[this.guessNum],
          guessDate: dateService.dayToDate(guess));
      _send(dataObj);
    }
  }
  
  void _send(MainPageDataObj data) {
    this._mainPageData.sink.add(data);
  }
  
  void before() {
    this.high = this.guess - 1;
    _makeGuess();
  }
  
  void after() {
    this.low = this.guess + 1;
    _makeGuess();
  }
  
  void correct() {
    this._mainPageData.sink.add(MainPageDataObj(correct: true));
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

