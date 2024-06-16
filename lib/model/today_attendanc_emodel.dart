class TodayAttendance {
  String userId;
  String name;
  DateTime date;
  String checkIn;
  String checkOut;
  String lunchIn;
  String lunchOut;
  String isOnLeave;
  String checkInImage;
  String checkOutImage;
  String lunchInImage;
  String lunchOutImage;
  String attendanceId;
  String shifttype;

  TodayAttendance(
      this.userId,
      this.name,
      this.date,
      this.checkIn,
      this.checkOut,
      this.lunchIn,
      this.lunchOut,
      this.isOnLeave,
      this.checkInImage,
      this.checkOutImage,
      this.lunchInImage,
      this.lunchOutImage,
      this.attendanceId,
      this.shifttype);
}
