import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/pages/call_screen.dart';
import 'package:flutterwhatsapp/pages/camera_screen.dart';
import 'package:flutterwhatsapp/pages/chat_screen.dart';
import 'package:flutterwhatsapp/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;
  Icon icon = Icon(
    Icons.message,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
        icon = Icon(
          Icons.message,
          color: Colors.white,
        );
      } else if (_tabController.index == 2) {
        showFab = true;
        icon = Icon(
          Icons.camera_alt,
          color: Colors.white,
        );
      } else if (_tabController.index == 3) {
        showFab = true;
        icon = Icon(
          Icons.call,
          color: Colors.white,
        );
      } else if (_tabController.index == 0) {
        showFab = false;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text(
                'New group',
              )),
              PopupMenuItem(
                  child: Text(
                'New broadcast',
              )),
              PopupMenuItem(
                  child: Text(
                'Linked devices',
              )),
              PopupMenuItem(
                  child: Text(
                'Starred messages',
              )),
              PopupMenuItem(
                  child: Text(
                'Settings',
              ))
            ],
            child: Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(widget.cameras),
          ChatScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).accentColor,
              child: icon,
              onPressed: () => print("open chats"),
            )
          : null,
    );
  }
}
