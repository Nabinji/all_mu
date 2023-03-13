// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_carousel_slider/carousel_slider.dart';

// class ImageSliserFirebase extends StatefulWidget {
//   const ImageSliserFirebase({Key? key}) : super(key: key);

//   @override
//   State<ImageSliserFirebase> createState() => _MyAppState();
// }

// class _MyAppState extends State<ImageSliserFirebase> {
//   late Stream<QuerySnapshot> imageStream;
//   int currentSlideIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     var firestore = FirebaseFirestore.instance;
//     imageStream = firestore.collection("Carousel_images").snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 300,
//             child: StreamBuilder<QuerySnapshot>(
//               stream: imageStream,
//               builder: (_, snapshot) {
//                 if (snapshot.hasData && snapshot.data!.docs.length > 1) {
//                   return CarouselSlider.builder(
//                     unlimitedMode: true,
//                     enableAutoSlider: true,
//                     slideBuilder: (index) {
//                       DocumentSnapshot sliderimage = snapshot.data!.docs[index];
//                       return Image.network(
//                         sliderimage['img'],
//                         fit: BoxFit.fill,
//                       );
//                     },
//                     slideIndicator: CircularSlideIndicator(
//                         indicatorBackgroundColor:
//                             const Color.fromARGB(144, 163, 138, 138),
//                         currentIndicatorColor: Colors.black),
//                     slideTransform: const CubeTransform(rotationAngle: 10),
//                     itemCount: snapshot.data!.docs.length,
//                   );
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ImageSliserFirebase extends StatefulWidget {
//   const ImageSliserFirebase({Key? key}) : super(key: key);

//   @override
//   State<ImageSliserFirebase> createState() => _MyAppState();
// }

// class _MyAppState extends State<ImageSliserFirebase> {
//   late String imageUrl = '';

//   @override
//   void initState() {
//     super.initState();
//     var firestore = FirebaseFirestore.instance;
//     firestore.collection("Carousel_images").doc('imgs').get().then((snapshot) {
//       if (snapshot.exists) {
//         var sliderimage = snapshot.data() as Map<String, dynamic>;
//         setState(() {
//           imageUrl = sliderimage['imgs'];
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 300,
//             child: Image(
//               image: NetworkImage(imageUrl),
//               fit: BoxFit.fill,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
