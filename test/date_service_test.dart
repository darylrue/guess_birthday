import 'package:flutter_test/flutter_test.dart';
import 'package:guess_birthday/date_service.dart';

void main() {
  test('DateService test', () async {
    var dateSvc = DateService();
    expect(dateSvc.dayToDate(1), 'January 1');
    expect(dateSvc.dayToDate(31), 'January 31');
    expect(dateSvc.dayToDate(32), 'February 1');
    expect(dateSvc.dayToDate(60), 'February 29');
    expect(dateSvc.dayToDate(61), 'March 1');
    expect(dateSvc.dayToDate(91), 'March 31');
    expect(dateSvc.dayToDate(92), 'April 1');
    expect(dateSvc.dayToDate(121), 'April 30');
    expect(dateSvc.dayToDate(122), 'May 1');
    expect(dateSvc.dayToDate(152), 'May 31');
    expect(dateSvc.dayToDate(153), 'June 1');
    expect(dateSvc.dayToDate(182), 'June 30');
    expect(dateSvc.dayToDate(183), 'July 1');
    expect(dateSvc.dayToDate(213), 'July 31');
    expect(dateSvc.dayToDate(214), 'August 1');
    expect(dateSvc.dayToDate(244), 'August 31');
    expect(dateSvc.dayToDate(245), 'September 1');
    expect(dateSvc.dayToDate(274), 'September 30');
    expect(dateSvc.dayToDate(275), 'October 1');
    expect(dateSvc.dayToDate(305), 'October 31');
    expect(dateSvc.dayToDate(306), 'November 1');
    expect(dateSvc.dayToDate(335), 'November 30');
    expect(dateSvc.dayToDate(336), 'December 1');
    expect(dateSvc.dayToDate(366), 'December 31');
  });
}
