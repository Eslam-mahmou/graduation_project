 double extractAttendancePrecent(int totalDays,int attendanceCount){
  int numOfLec=extractNumberOfLectures(totalDays).toInt();
  var precent=(attendanceCount/numOfLec)*100 .toInt();
  return precent;
 }

 double extractNumberOfLectures(int totalDays){
  var days=totalDays ~/2;
  var numOfWeeks=days~/7;
  int numOfLec=numOfWeeks - 4;
  return numOfLec.toDouble();
 }