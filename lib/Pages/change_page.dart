import 'package:flutter/material.dart';

class ChangeTemp extends StatelessWidget {
  const ChangeTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request change"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/result.png",
              scale: .5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write your issue here',
                  labelText: "Tell your issue",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
