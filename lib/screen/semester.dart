import 'package:all_mu/widget/common_list_tile.dart';
import 'package:flutter/material.dart';

import '../semester/first_sem.dart';
import '../semester/fourth_sem.dart';
import '../semester/second_sem.dart';
import '../semester/third_sem.dart';

class Semester extends StatelessWidget {
  Semester(this.college, {super.key});
  Map college;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${college['name']}'),
      ),
      body: Center(
        child: ListView(
          children: [
            CommonListTiles(
              title: '${college['sem1']}',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstSemester(college)));
              },
            ),
            CommonListTiles(
              title: '${college['sem2']}',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondSemester(college)));
              },
            ),
            CommonListTiles(
              title: '${college['sem3']}',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdSemester(college)));
              },
            ),
            CommonListTiles(
              title: '${college['sem4']}',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FourthSemester(college)));
              },
            ),
            // CommonListTiles(
            //   title: '${college['sem5']}',
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
