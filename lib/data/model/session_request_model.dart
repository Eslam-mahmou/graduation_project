class SessionModel {
  final DateTime date;
  final String startTime;
  final String endTime;
  final int academicYearId;



  final now = DateTime.now();

  //final formattedStartTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

  SessionModel({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.academicYearId,
  });
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String().split('T').first,
      'startTime': startTime,
      'endTime': endTime,
      'academicYearId': academicYearId,
    };
  }
}
