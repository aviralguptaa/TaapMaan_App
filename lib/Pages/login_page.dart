import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  moveToEnter(BuildContext context){
    if(_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.enterRoute);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TaapMaan"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/3324647.jpg",
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 05,
                ),
                const Text(
                  //"Welcome $name",
                  "Welcome to TaapMaan",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName",
                        ),
                        validator: (value){
                          if(value!=null && value.isEmpty){
                            return "Username cannot be empty !";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value){
                          if(value!=null && value.isEmpty){
                            return "Password cannot be empty !";
                          }else if(value!=null && value.length<6){
                            return "Password length cannot be less than 6";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Easy Animation
                // InkWell(
                //   onTap: (){
                //     setState(() {
                //     });
                //     // Navigator.pushNamed(context, MyRoutes.homeRoute);
                //   },
                //   child: Container(
                //     height: 40,
                //     width: 90,
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //       color: Colors.red,
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     child: const Text(
                //       "Login",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 19,
                //       ),
                //     ),
                //   ),
                // )
                ElevatedButton(
                  onPressed: () => moveToEnter(context),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(90, 40),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
