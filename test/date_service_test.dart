import 'package:flutter_test/flutter_test.dart';
import 'package:guess_birthday/date_service.dart';

void main() {
  test('DateService test', () async {
    expect(DateService.dayToDate(1), 'January 1');
    expect(DateService.dayToDate(31), 'January 31');
    expect(DateService.dayToDate(32), 'February 1');
    expect(DateService.dayToDate(60), 'February 29');
    expect(DateService.dayToDate(61), 'March 1');
    expect(DateService.dayToDate(91), 'March 31');
    expect(DateService.dayToDate(92), 'April 1');
    expect(DateService.dayToDate(121), 'April 30');
    expect(DateService.dayToDate(122), 'May 1');
    expect(DateService.dayToDate(152), 'May 31');
    expect(DateService.dayToDate(153), 'June 1');
    expect(DateService.dayToDate(182), 'June 30');
    expect(DateService.dayToDate(183), 'July 1');
    expect(DateService.dayToDate(213), 'July 31');
    expect(DateService.dayToDate(214), 'August 1');
    expect(DateService.dayToDate(244), 'August 31');
    expect(DateService.dayToDate(245), 'September 1');
    expect(DateService.dayToDate(274), 'September 30');
    expect(DateService.dayToDate(275), 'October 1');
    expect(DateService.dayToDate(305), 'October 31');
    expect(DateService.dayToDate(306), 'November 1');
    expect(DateService.dayToDate(335), 'November 30');
    expect(DateService.dayToDate(336), 'December 1');
    expect(DateService.dayToDate(366), 'December 31');
  });
}
