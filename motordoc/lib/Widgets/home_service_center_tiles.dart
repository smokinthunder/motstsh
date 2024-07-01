import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class ServiceCenterTile extends StatelessWidget {
  const ServiceCenterTile({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference serviceCenters =
        FirebaseFirestore.instance.collection('Service Centers');

    Stream<QuerySnapshot> getServiceCenters() {
      return serviceCenters.snapshots();
    }

    return StreamBuilder<QuerySnapshot>(
        stream: getServiceCenters(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.error}',style: const TextStyle(color: Colors.white),);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading",style: TextStyle(color: Colors.white),);
          }
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Container(
                    margin: const EdgeInsets.only(right: 50),
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: C.darkGreyBox,
                    ),
                    child: Text(data['Name'],style: const TextStyle(color: Colors.white),),
                  );
                }).toList(),),
          );
        });
  }
}
