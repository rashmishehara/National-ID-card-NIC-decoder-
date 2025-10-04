import 'package:intl/intl.dart';

Map<String, dynamic> decodeNIC(String nic) {
  int year, dayOfYear;
  String gender, dobString;

  //Check is it an old NIC or a new NIC
  bool isOldNIC = nic.length == 9 || nic.length == 10;

  if (isOldNIC) {
    year = 1900 + int.parse(nic.substring(0, 2));
    dayOfYear = int.parse(nic.substring(2, 5));
  } else {
    year = int.parse(nic.substring(0, 4));
    dayOfYear = int.parse(nic.substring(4, 7));
  }

  //Determine gender
  gender = dayOfYear > 500 ? 'Female' : 'Male';
  if (dayOfYear > 500) dayOfYear -= 500;

  //Calculate the date of birth
  DateTime dob = DateTime(year, 1, 1).add(Duration(days: dayOfYear - 1));
  dob = dob.subtract(Duration(days: 1));

  dobString = DateFormat('yyyy-MM-dd').format(dob);
  String weekday = DateFormat('EEEE').format(dob); //Find the day of the week

  // Calculate age
  DateTime today = DateTime.now();
  int age = today.year - dob.year;

  if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
    age--;
  }

  return {
    "year": year,
    "dob": dobString,
    "weekday": weekday,
    "gender": gender,
    "age": age,
    "isOldNIC": isOldNIC,
  };
}
