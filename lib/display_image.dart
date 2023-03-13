import 'package:all_mu/screen/home_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final Stream<QuerySnapshot> stream;

  final String imageofCard;
  const DisplayImage(
      {super.key, required this.stream, required this.imageofCard});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }
          List<DropdownMenuItem> collageItems = [];
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            final collages = snapshot.data?.docs.reversed.toList();
            if (collages != null) {
              for (var collage in collages) {
                collageItems.add(
                  DropdownMenuItem(
                    value: collage.id,
                    child: Text(collage['name']),
                  ),
                );
              }
            }

            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              List<Map> items = documents
                  .map((e) => {
                        'id': e.id,
                        'name': e['name'],
                        'semester': e['semester'],
                        'syllabus': e['syllabus'],
                        'contact': e['contact'],
                        'imgs': e['imgs'],
                      })
                  .toList();

              return Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10, right: 10, bottom: 5),
                child: Container(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.network(imageofCard)),
              );
            }

            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
