import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'result_screen.dart';

class NICInputScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NIC Decoder')),
      body: Stack(
        children: [
          Container(
            color: Colors.white.withOpacity(0.7), //Background color
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 8, //Shadow effect for the card
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Enter Your NIC Number',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: nicController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'[^0-9vV]')), //Prevents invalid characters
                        ],
                        decoration: InputDecoration(
                          labelText: 'NIC Number',
                          hintText:
                              'Enter your NIC Number',
                          prefixIcon: Icon(Icons.perm_identity),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 11, 99, 126),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding:
                              EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                        ),
                        onPressed: () {
                          String nic = nicController.text.trim().toUpperCase();
                          if (_isValidNIC(nic)) {
                            Get.to(ResultScreen(
                                nic: nic)); //Navigate to ResultScreen with NIC data
                          } else {
                            Get.snackbar(
                              'Invalid NIC',
                              'Please enter a valid NIC number (9-digit + V or 12-digit number).',
                              backgroundColor: Colors.red.withOpacity(0.9),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              margin: EdgeInsets.all(10),
                              duration: Duration(seconds: 3),
                            );
                          }
                        },
                        child: Text(
                          'Decode',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //NIC Validation Function
  bool _isValidNIC(String nic) {
    nic = nic.trim().toUpperCase();

    if (nic.length == 10 && RegExp(r'^\d{9}[Vv]$').hasMatch(nic))
      return true; //Old NIC format
    if (nic.length == 12 && RegExp(r'^\d{12}$').hasMatch(nic))
      return true; //New NIC format

    return false; // Invalid NIC
  }
}
