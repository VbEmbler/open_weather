extension CompareDates on DateTime {
  //Compare date. If date is equal by year, month and day returns true
  bool isDateEqual(DateTime secondDate) {
    return year == secondDate.year && month == secondDate.month && day == secondDate.day;
  }
}