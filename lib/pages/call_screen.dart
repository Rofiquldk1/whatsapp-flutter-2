import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/Helper.dart';
import '../models/call_model.dart';

class CallsScreen extends StatefulWidget {
  @override
  CallsScreenState createState() {
    return new CallsScreenState();
  }
}

class CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 10.0,
          ),
          new ListTile(
              leading: new CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
              ),
              title: Text(
                dummyData[i].name,
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  dummyData[i].time,
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              trailing: Icon(Icons.call,
                  color: Color(Helper.getColorHexFromStr("#116a5d"))))
        ],
      ),
    );
  }
}
