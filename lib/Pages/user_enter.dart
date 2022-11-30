import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';

class UserEnter extends StatelessWidget {
  const UserEnter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TaapMaan"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/3685379.jpg",
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "One Stop",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "Temperature Monitor",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
              //   child: TextFormField(
              //     decoration: const InputDecoration(
              //         hintText: "Enter Room No",
              //         labelText: "Room No",
              //         labelStyle: TextStyle(
              //           fontSize: 20,
              //         )),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.resultRoute1);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text(
                          "LT6",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.resultRoute2);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text(
                          "LT5",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.resultRoute3);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text(
                          "MPH",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
