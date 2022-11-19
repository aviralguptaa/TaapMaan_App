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
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.resultRoute1);
                      },
                      child: const Text("Room 1"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.resultRoute2);
                      },
                      child: const Text("Room 2"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.resultRoute3);
                      },
                      child: const Text("Room 3"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.resultRoute4);
                      },
                      child: const Text("Room 4"),
                    ),
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //   Navigator.pushNamed(context, MyRoutes.resultRoute);
              //   },
              //   child: const Text("Check",style: TextStyle(
              //     fontSize: 15,
              //   ),),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
