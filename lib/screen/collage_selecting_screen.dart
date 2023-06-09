import 'package:all_mu/widget/stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CollageSelectingScreen extends StatefulWidget {
  const CollageSelectingScreen({super.key});

  @override
  _CollageSelectingScreenState createState() => _CollageSelectingScreenState();
}

class _CollageSelectingScreenState extends State<CollageSelectingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select your collage with departments"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonStream(
                stream: FirebaseFirestore.instance
                    .collection('Science_and_Technology')
                    .snapshots(),
                hint: "Science and Technology"),
            CommonStream(
                stream: FirebaseFirestore.instance
                    .collection('Management')
                    .snapshots(),
                hint: "Management"),
            CommonStream(
              stream: FirebaseFirestore.instance
                  .collection('Engineering')
                  .snapshots(),
              hint: "Engineering",
            ),
          ],
        ),
      ),
    );
  }
}
