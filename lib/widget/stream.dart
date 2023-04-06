import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../screen/home_Screen.dart';

class CommonStream extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final String hint;
  const CommonStream({super.key, required this.stream, required this.hint});

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
                      'sem1': e['sem1'],
                      'sem2': e['sem2'],
                      'sem3': e['sem3'],
                      'sem4': e['sem4'],
                      'note': e['note'],
                      'book': e['book'],
                      'question': e['question'],
                      'noteurl': e['noteurl'],
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
                child: DropdownButton(
                  dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                  icon: const Icon(Icons.arrow_drop_down),
                  hint: Text(hint),
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.black, fontSize: 22),
                  items: collageItems,
                  onChanged: (value) {
                    Map thisItem =
                        items.firstWhere((item) => item['id'] == value);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(thisItem)),
                    );
                  },
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
