class DateService {

  /// Assumes Feb has 29 days, Year has 366 days, day param is between 1 and 366
  String dayToDate(int day) {
    if (day < 183) {
      return _h1(day);
    }
    return _h2(day);
  }
  
  /// 1 to 182
  String _h1(int day) {
    if (day < 92) {
      return _q1(day);
    }
    return _q2(day);
  }
  
  /// 183 to 366
  String _h2(int day) {
    if (day < 275) {
      return _q3(day);
    }
    return _q4(day);
  }
  
  /// 1 to 91
  String _q1(int day) {
    if (day < 32) {
      return 'January $day';
    }
    if (day < 61) {
      return 'February ${day - 31}';
    }
    return 'March ${day - 60}';
  }
  
  /// 92 to 182
  String _q2(int day) {
    if (day < 122) {
      return 'April ${day - 91}';
    }
    if (day < 153) {
      return 'May ${day - 121}';
    }
    return 'June ${day - 152}';
  }

  /// 183 to 274
  String _q3(int day) {
    if (day < 214) {
      return 'July ${day - 182}';
    }
    if (day < 245) {
      return 'August ${day - 213}';
    }
    return 'September ${day - 244}';
  }
  
  /// 275 to 366
  String _q4(int day) {
    if (day < 306) {
      return 'October ${day - 274}';
    }
    if (day < 336) {
      return 'November ${day - 305}';
    }
    return 'December ${day - 335}';
  }
}



