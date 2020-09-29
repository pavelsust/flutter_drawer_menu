import 'package:flutter/material.dart';
import 'package:flutter_drawer_menu/test/lib/bottombar/MyHomePage.dart';
import 'package:flutter_drawer_menu/test/lib/pages/drawer_menu.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tutorial"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text("Drawer Menu"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text("Bottom Menu"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
            )
          ],
        ));
  }
}
