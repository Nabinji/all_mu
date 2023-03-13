import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String imageofCard;
  const CommonCard(
      {super.key, required this.title, this.onTap, required this.imageofCard});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 3,
          child: Column(children: [
            SizedBox(
              height: 130,
              width: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageofCard,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            )
          ]),
        ),
      ),
    );
  }
}
