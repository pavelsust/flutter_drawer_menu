import 'package:flutter/material.dart';
import 'package:flutter_drawer_menu/test/lib/fragments/first_fragment.dart';
import 'package:flutter_drawer_menu/test/lib/fragments/second_fragment.dart';
import 'package:flutter_drawer_menu/test/lib/fragments/third_fragment.dart';
import 'package:flutter_drawer_menu/test/lib/pages/drawer_menu.dart';

class DrawerWithBottom extends StatefulWidget {
  var drawerItems = [
    new DrawerItem("Favorites", Icons.rss_feed),
    new DrawerItem("Music", Icons.local_pizza),
    new DrawerItem("Places", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return _DrawerWithBottom();
  }
}

class _DrawerWithBottom extends State<DrawerWithBottom> {
  int _currentIndex = 0;

  String currentProfilePic = "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _currentIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _currentIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return WillPopScope(
      onWillPop: () {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          _getDrawerItemWidget(_currentIndex);
        } else {
          Navigator.pop(context, true);
        }
        return;
      },
      child: Scaffold(
        appBar: new AppBar(
          // here we display the title corresponding to the fragment
          // you can instead choose to have a static title
          title: new Text(widget.drawerItems[_currentIndex].title),
        ),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: new Text("bramvbilsen@gmail.com"),
                accountName: new Text("Bramvbilsen"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(currentProfilePic),
                  ),
                  onTap: () => print("This is your current account."),
                ),
              ),
              Column(children: drawerOptions)
            ],
          ),
        ),
        body: _getDrawerItemWidget(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: Colors.red,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Favorites'),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('Music'),
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              title: Text('Places'),
              icon: Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Welcome to Flutter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}

