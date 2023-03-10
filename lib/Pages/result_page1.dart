import 'dart:convert';
import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catalogapp/utils/networking.dart';

var temp1 = "";
var hum1 = "";

class ResultShow1 extends StatefulWidget {
  const ResultShow1({Key? key}) : super(key: key);

  @override
  State<ResultShow1> createState() => _ResultShow1State();
}

class _ResultShow1State extends State<ResultShow1> {
  @override
  void initState() {
    getTempFromSheet();
    super.initState();
  }


  getTempFromSheet() async {
    NetworkHelper networkHelper =NetworkHelper('https://script.google.com/macros/s/AKfycbyIy64fwmQbjtjb34CmIDdHyhZw-_jB60aPqdiZAq4g1bkje7oOfovZSDp81PRlHBU7/exec');
    var tempData = await networkHelper.getData();
    updateUI(tempData);
  }

  void updateUI(dynamic tempData){
    temp1 = tempData[0]['Ftemp'].toString();
    hum1 = tempData[0]['Fhum'].toString();
    print(temp1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Room 1"),
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temp1 `C',
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  hum1,
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

// class TempTile extends StatefulWidget {
//   String temperature1,
//       humidity1,
//       temperature2,
//       humidity2,
//       temperature3,
//       humidity3,
//       temperature4,
//       humidity4;
//
//   TempTile(
//       {this.temperature1 = "",
//       this.humidity1 = "",
//       this.humidity2 = "",
//       this.temperature2 = "",
//       this.humidity3 = "",
//       this.temperature3 = "",
//       this.humidity4 = "",
//       this.temperature4 = ""});
//
//   @override
//   State<TempTile> createState() => _TempTileState();
// }
//
// class _TempTileState extends State<TempTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           widget.temperature1,
//           style: const TextStyle(
//             fontSize: 40,
//           ),
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         const Text(
//           '`C',
//           style: TextStyle(
//             fontSize: 30,
//           ),
//         ),
//         const SizedBox(width: 20),
//         Text(
//           widget.humidity1,
//           style: const TextStyle(
//             fontSize: 40,
//           ),
//         ),
//       ],
//     );
//   }
// }
