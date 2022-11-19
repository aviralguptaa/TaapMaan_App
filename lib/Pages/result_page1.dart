import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../temp_model.dart';

class ResultShow1 extends StatefulWidget {
  const ResultShow1({Key? key}) : super(key: key);

  @override
  State<ResultShow1> createState() => _ResultShow1State();
}

class _ResultShow1State extends State<ResultShow1> {
  List<TempModel> temperatures = <TempModel>[];
  getTempFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxwBQmRPoX3noZ3j-I2-VpBJ1aQ1LxCcwRnGBMt1D-6P2MWZM6OikyqBW-wW_ZI2fw8mw/exec"));
    var jsonTemp = convert.jsonDecode(raw.body);

    print('this is json temp $jsonTemp');

    jsonTemp.forEach((var element) {
      print(element);
      TempModel tempModel = new TempModel();
      tempModel.temperature1 = element['temperature1'].toString();
      tempModel.humidity1 = element['humidity1'].toString();
      tempModel.temperature2 = element['temperature2'].toString();
      tempModel.humidity2 = element['humidity2'].toString();
      tempModel.temperature3 = element['temperature3'].toString();
      tempModel.humidity3 = element['humidity3'].toString();
      tempModel.temperature4 = element['temperature4'].toString();
      tempModel.humidity4 = element['humidity4'].toString();

      temperatures.add(tempModel);
      // print("Length = ${temperatures.length}");
    });
  }

  @override
  void initState() {
    getTempFromSheet();
    super.initState();
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
            // SfRadialGauge(
            //   title: const GaugeTitle(text: "Room Temperature"),
            // ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TempTile(
                  temperature1: temperatures[1].temperature1,
                  humidity1: temperatures[1].humidity1,
                )
              ],
            )),

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
                Navigator.pushNamed(context, MyRoutes.adminLandRoute);
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

class TempTile extends StatefulWidget {
  String temperature1,
      humidity1,
      temperature2,
      humidity2,
      temperature3,
      humidity3,
      temperature4,
      humidity4;

  TempTile(
      {
        this.temperature1 = "",
        this.humidity1 = "",
        this.humidity2 = "",
        this.temperature2 = "",
        this.humidity3 = "",
        this.temperature3 = "",
        this.humidity4 = "",
        this.temperature4 = ""});

  @override
  State<TempTile> createState() => _TempTileState();
}

class _TempTileState extends State<TempTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.temperature1,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          '`C',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          widget.humidity1,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
