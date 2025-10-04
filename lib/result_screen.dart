import 'package:flutter/material.dart';
import 'decode.dart';

class ResultScreen extends StatelessWidget {
  final String nic;
  ResultScreen({required this.nic});

  @override
  Widget build(BuildContext context) {
    final result = decodeNIC(nic);
    bool isOldNIC = result["isOldNIC"];

    return Scaffold(
      appBar: AppBar(title: Text('NIC Details')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'NIC Details',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(thickness: 1.5),
                SizedBox(height: 10),

                //Display decoded NIC details
                infoRow('NIC', nic),
                infoRow('Format', isOldNIC ? "Old NIC (9-digit)" : "New NIC (12-digit)"),
                infoRow('Birth Year', result["year"].toString()),
                infoRow('Date of Birth', result["dob"]),
                infoRow('Weekday', result["weekday"]),
                infoRow('Gender', result["gender"]),
                infoRow('Age', result["age"].toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            ":",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
