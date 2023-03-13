import 'package:all_mu/widget/cards.dart';
import 'package:flutter/material.dart';

class SevenSemester extends StatelessWidget {
  SevenSemester(this.college, {super.key});
  Map college;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${college['name']}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.count(
                crossAxisCount: 2,
                primary: false,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                shrinkWrap: true,
                children: [
                  CommonCard(
                      title: '${college['note']}',
                      imageofCard: '${college['imgs']}'),
                  CommonCard(
                      title: '${college['book']}',
                      imageofCard: '${college['imgs']}'),
                  CommonCard(
                      title: '${college['question']}',
                      imageofCard: '${college['imgs']}'),
                ]),
          ],
        ),
      ),
    );
  }
}
