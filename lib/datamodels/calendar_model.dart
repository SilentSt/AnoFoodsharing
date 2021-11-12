class CalendarModel {
  final String day;
  final String where;
  final String fromWhere;
  final String time;

  CalendarModel(
      this.day,
      this.where,
      this.fromWhere,
      this.time
      );

  CalendarModel.fromJson(Map<String, dynamic> json):
        day = json['day'],
        where = json['where'],
        fromWhere = json['fromWhere'],
        time = json['time']
  ;

  Map<String, dynamic> toJson() =>
      {
        'day': day,
        'where': where,
        'fromWhere': fromWhere,
        'time':time,
      };
}
