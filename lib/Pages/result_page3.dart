import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:catalogapp/utils/networking.dart';

var temp3 = "";
var hum3 = "";

class ResultShow3 extends StatefulWidget {
  const ResultShow3({Key? key}) : super(key: key);

  @override
  State<ResultShow3> createState() => _ResultShow3State();
}

class _ResultShow3State extends State<ResultShow3> {
  @override

  void initState() {
    getTempFromSheet();
    super.initState();
  }

  getTempFromSheet() async {
    NetworkHelper networkHelper =NetworkHelper('https://script.google.com/macros/s/AKfycbw1ka8Y-ivcsg-Q_rxgnCYVad3bYYF_gnGYhmlceHjiUmlRCTwhTdxr5SW80EU-PPJP/exec');
    var tempData = await networkHelper.getData();
    updateUI(tempData);
  }

  void updateUI(dynamic tempData){
    temp3 = tempData[0]['temperature'].toString();
    hum3 = tempData[0]['humidity'].toString();
    print(temp3);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Room 3"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Image.asset(
            //   "assets/images/result.png",
            //   scale: .55,
            // ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "The Temperature",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "in the room is",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temp3 `C',
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  hum3,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.enterRoute);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "Check for another room",
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
                // Navigator.pushNamed(context, MyRoutes.changeRoute);
                Navigator.pushNamed(context, MyRoutes.changeRoute);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "Request for change",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
