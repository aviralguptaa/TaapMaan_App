import 'package:flutter/material.dart';
import 'package:catalogapp/utils/routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TaapMaan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 15,),
            const Text(
              'Welcome to TaapMaan !',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('assets/images/5292749.jpg'),
            const SizedBox(height: 10),
            const Text('The own temperature ',
            style: TextStyle(
              fontSize: 23,
            ),),
            const Text('monitoring app of JIIT 128',
              style: TextStyle(
                fontSize: 23,
              ),),
            const SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.adminLandRoute);
              },
              child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 7,horizontal: 5),
              child: Text('Admin',style: TextStyle(fontSize: 20),),
            )),
            const SizedBox(height: 13,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 7,horizontal: 15),
                child: Text('User',style: TextStyle(
                  fontSize: 20,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
