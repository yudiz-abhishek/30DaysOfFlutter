import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageURL =
        "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg";
    return Drawer(
      child: Container(
        //For Remove upper and below white space wrap it into container
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                //For remove padding space
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  //For remove margin space
                  margin: EdgeInsets.zero,
                  accountName: Text("Abhishek Bakhai"),
                  accountEmail: Text("abhishek.b@yudiz.com"),
                  currentAccountPicture: CircleAvatar(
                    //For Assest Use Asset,
                    //For Network User a NetworkImage
                    backgroundImage: NetworkImage(imageURL),
                  ),
                )),
            //First Item
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            //Second Item
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            //Third Item
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email Me",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
