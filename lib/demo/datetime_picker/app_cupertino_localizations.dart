import 'package:flutter/cupertino.dart';
class AppCupertinoLocalizations extends CupertinoLocalizations {
  final CupertinoLocalizations _localizations;

  AppCupertinoLocalizations(this._localizations);

  //只改此处，其它的都原数据返回
  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  String datePickerYear(int yearIndex) => _localizations.datePickerYear(yearIndex);

  @override
  String get modalBarrierDismissLabel => _localizations.modalBarrierDismissLabel;

  @override
  String get selectAllButtonLabel => _localizations.selectAllButtonLabel;

  @override
  String get pasteButtonLabel => _localizations.pasteButtonLabel;

  @override
  String get copyButtonLabel => _localizations.copyButtonLabel;

  @override
  String get cutButtonLabel => _localizations.cutButtonLabel;

  @override
  String timerPickerSecondLabel(int second) => _localizations.timerPickerSecondLabel(second);

  @override
  String timerPickerMinuteLabel(int minute) => _localizations.timerPickerMinuteLabel(minute);

  @override
  String timerPickerHourLabel(int hour) => _localizations.timerPickerHourLabel(hour);

  @override
  String timerPickerSecond(int second) => _localizations.timerPickerSecond(second);

  @override
  String timerPickerMinute(int minute) => _localizations.timerPickerMinute(minute);

  @override
  String timerPickerHour(int hour) => _localizations.timerPickerHour(hour);

  @override
  String tabSemanticsLabel({int tabIndex, int tabCount}) =>
      _localizations.tabSemanticsLabel(tabIndex: tabIndex, tabCount: tabCount);

  @override
  String get alertDialogLabel => _localizations.alertDialogLabel;

  @override
  String get todayLabel => _localizations.todayLabel;

  @override
  String get postMeridiemAbbreviation => _localizations.postMeridiemAbbreviation;

  @override
  String get anteMeridiemAbbreviation => _localizations.anteMeridiemAbbreviation;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => _localizations.datePickerDateTimeOrder;

  @override
  String datePickerMinuteSemanticsLabel(int minute) => _localizations.datePickerMinuteSemanticsLabel(minute);

  @override
  String datePickerMinute(int minute) => _localizations.datePickerMinute(minute);

  @override
  String datePickerHourSemanticsLabel(int hour) => _localizations.datePickerHourSemanticsLabel(hour);

  @override
  String datePickerHour(int hour) => _localizations.datePickerHour(hour);

  @override
  String datePickerMediumDate(DateTime date) => _localizations.datePickerMediumDate(date);

  @override
  String datePickerDayOfMonth(int dayIndex) => _localizations.datePickerDayOfMonth(dayIndex);

  @override
  String datePickerMonth(int monthIndex) => _localizations.datePickerMonth(monthIndex);

}

class AppGlobalCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  @override
  bool isSupported(Locale locale) => DefaultCupertinoLocalizations.delegate.isSupported(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    var localizations = await DefaultCupertinoLocalizations.delegate.load(locale);
    return AppCupertinoLocalizations(localizations);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) =>
      DefaultCupertinoLocalizations.delegate.shouldReload(old);

  @override
  String toString() => 'AppGlobalCupertinoLocalizationsDelegate';
}
