import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';

class AdminLanding extends StatelessWidget {
  const AdminLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/administrator.png",
              scale: .2,
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,MyRoutes.enterRoute);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "Check room temperature",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {


              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "View Requests",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
