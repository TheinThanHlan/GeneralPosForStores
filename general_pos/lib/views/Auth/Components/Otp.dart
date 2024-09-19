import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp extends StatelessWidget {
  TextEditingController otp;
  Otp({required this.otp});
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(
        "Signin",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
      Text(
        "sent otp code to your gmail account.",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
      TextFormField(
        controller: otp,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter Otp',
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            print(otp.text);
          },
          child: Text("Next"),
        ),
      )
    ]);
  }
}
