class StartSessionResponseEntity {
  StartSessionResponseEntity({
      this.id,
      this.instructorId, 
      this.courseId,
      this.date, 
      this.startTime, 
      this.endTime, 
      this.academicYearId, 
      this.academicYear, 
      this.sessionDetails,});
  num? id;
  num? instructorId;
  num? courseId;
  String? date;
  String? startTime;
  String? endTime;
  num? academicYearId;
  dynamic academicYear;
  dynamic sessionDetails;

}

