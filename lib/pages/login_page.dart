import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBtn = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/ic_login_logo.png",
                fit: BoxFit.cover,
              ),
              //For Space (padding)
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome, ${name}",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //For Space (padding)
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      //For OnChange Value while user typing add to welcome text
                      onChanged: (value) {
                        name = value;
                        //For change state (work as a reload particalur state)
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      //For Seucre text default => False
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ), //For Space (padding)
                    SizedBox(
                      height: 40.0,
                    ),

                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // )
                    //For Container with Clickable event
                    InkWell(
                      onTap: () async {
                        //For changing button state
                        setState(() {
                          //For Container Width Change for animation
                          changeBtn = true;
                        });

                        //Same as swift when we are using await func must be async
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeBtn ? 50 : 150,
                        height: 50,
                        //If we are using decoration at that time we need to give color in decoration
                        // color: Colors.deepPurple,
                        alignment: Alignment.center,
                        child: changeBtn
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            // shape:
                            //     changeBtn ? BoxShape.circle : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changeBtn ? 50 : 8)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
