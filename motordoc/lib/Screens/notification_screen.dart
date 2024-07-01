import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, bottom: 20, right: 20),
        child: Column(children: [
          const Text(
            "Notification\n",
            style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 30,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: (MediaQuery.maybeSizeOf(context)?.height??800)-124 ,
            width: double.infinity,
            child: ListView(
              
              children: const [
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
                BoxNotificationTile(),
            
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class BoxNotificationTile extends StatelessWidget {
  const BoxNotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemMint,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const CupertinoListTile(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          title: Text("Notification"),
          subtitle: Text("small details"),
          leading: Icon(CupertinoIcons.wrench),
        ),
      ),
    );
  }
}
