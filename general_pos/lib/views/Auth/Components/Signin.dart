import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signin extends StatelessWidget {
  TextEditingController email;
  Function invoke;
  Signin({required this.email, required this.invoke});
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(
        "Signup",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
      TextFormField(
        controller: email,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter your email address',
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            print(email.text);
          },
          child: Text("Next"),
        ),
      )
    ]);
  }
}
