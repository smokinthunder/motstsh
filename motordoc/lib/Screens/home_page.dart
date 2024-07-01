import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/bottom_navigation.dart';
import '../Widgets/home_service_center_tiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(color: CupertinoColors.darkBackgroundGray),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                      child: const Icon(
                        CupertinoIcons.bell_fill,
                        color: CupertinoColors.white,
                        size: 30,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: const Text(
                    "Service Centres",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const ServiceCenterTile(),
                Container(),
                Container()
              ],
            ),
          ),
          const BottomNavigations(bottomNavigationIndex: 1),
        ],
      ),
    );
  }
}

// Future<String> readData() async {
//   final ref = FirebaseDatabase.instance.ref('service_centers/s1/name');
//   // ref.once().then((DataSnapshot ds) {
//   //   print(ds.value);
//   // });
//   var data = await ref.once();
//   String ll = data.snapshot.value.toString();
//   // print(ll);
//   // return (data.snapshot.children.length);
//   return ll;
// }
