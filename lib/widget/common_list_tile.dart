import 'package:flutter/material.dart';

class CommonListTiles extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CommonListTiles({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            const BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ));
  }
}
