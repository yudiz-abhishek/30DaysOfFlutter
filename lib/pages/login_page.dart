import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBtn = false;

  final _formKey = GlobalKey<FormState>();

//Funcation for Move to Home Page
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      //For changing button state
      setState(() {
        //For Container Width Change for animation
        changeBtn = true;
      });

      //Same as swift when we are using await func must be async
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      //For changing button state came from back
      setState(() {
        //For Container Width Change for animation
        changeBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        // title: Text("Login"),
        title: "Login".text.color(context.accentColor).make(),
      ),
      body: Center(
          child: Material(
              child: SingleChildScrollView(
        //For Form and Validation
        child: Form(
          //Global key for Form
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/ic_login_logo.png",
                // fit: BoxFit.fill,
                height: 200,
                width: 200,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Passsword cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
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
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius: BorderRadius.circular(changeBtn ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        //For change we can use Ink also here for check riple effect while tapping
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
                          // decoration: BoxDecoration(
                          //     color: Colors.deepPurple,
                          //     // shape:
                          //     //     changeBtn ? BoxShape.circle : BoxShape.rectangle,
                          //     borderRadius:
                          //         BorderRadius.circular(changeBtn ? 50 : 8)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }
}
