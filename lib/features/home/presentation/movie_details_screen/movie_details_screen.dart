// import 'package:flutter/material.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const MovieDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Movie Details"),
//       ),
//       body: Column(
//         children: [
//           Image.asset(
//             imagePath,
//             width: double.infinity,
//             height: 300,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             "Rating: $rating",
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Here will be movie details, description, actors, etc.",
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const MovieDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Movie Details")),
//       body: Column(
//         children: [
//           Image.asset(
//             imagePath,
//             height: 300,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             "Rating: $rating",
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white, // ✅ لون أبيض
//             ),
//           ),
//           const SizedBox(height: 20),
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Movie description and details go here...",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white, // ✅ لون أبيض
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.black, // ✅ خلفية غامقة عشان النص يبان
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const MovieDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           /// ✅ الخلفية
//           Positioned.fill(
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//             ),
//           ),
//
//           /// ✅ تظليل أسود فوق الخلفية
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.4),
//             ),
//           ),
//
//           /// ✅ المحتوى القابل للتمرير
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//
//                     /// 🔙 Back + Bookmark
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.arrow_back, color: Colors.white),
//                           onPressed: () {
//                             Navigator.pop(context); // 🔙 يرجعك للصفحة السابقة (HomeTab)
//                           },
//                         ),
//                         const Icon(Icons.bookmark_border, color: Colors.white),
//                       ],
//                     ),
//
//                     const SizedBox(height: 200),
//
//                     /// ▶️ زر التشغيل
//                     Center(
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(Icons.play_arrow, size: 40, color: Colors.amber),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     /// 📝 عنوان الفيلم
//                     const Text(
//                       "Doctor Strange in the Multiverse\nof Madness",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     const SizedBox(height: 8),
//
//                     /// 📅 سنة الإصدار
//                     const Text(
//                       "2022",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//
//                     const SizedBox(height: 24),
//
//                     /// 🎬 زر Watch
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Watch",
//                           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 24),
//
//                     /// 🔢 معلومات (لايك - تعليقات - تقييم)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         _InfoBox(icon: Icons.favorite, label: "15"),
//                         _InfoBox(icon: Icons.comment, label: "90"),
//                         _InfoBox(icon: Icons.star, label: "7.6"),
//                       ],
//                     ),
//
//                     const SizedBox(height: 40), // عشان تدي مساحة آخر الصفحة
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _InfoBox extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   const _InfoBox({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: ColorsManager.darkGrey,
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.yellowAccent),
//           const SizedBox(width: 6),
//           Text(label, style: const TextStyle(color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const MovieDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           /// ✅ الخلفية
//           Positioned.fill(
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//             ),
//           ),
//
//           /// ✅ تظليل أسود فوق الخلفية
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.4),
//             ),
//           ),
//
//           /// ✅ المحتوى القابل للتمرير
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//
//                     /// 🔙 Back + Bookmark
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.arrow_back, color: Colors.white),
//                           onPressed: () {
//                             Navigator.pop(context); // يرجع للصفحة السابقة
//                           },
//                         ),
//                         const Icon(Icons.bookmark_border, color: Colors.white),
//                       ],
//                     ),
//
//                     const SizedBox(height: 200),
//
//                     /// ▶️ زر التشغيل باستخدام SVG
//                     Center(
//                       child: Container(
//                         height: 80,
//                         padding: const EdgeInsets.all(20),
//                         decoration: const BoxDecoration(
//                         color: ColorsManager.yellow,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           SvgAssets.moviePlayIcon,
//                           height: 50,
//                           width: 50,
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     /// 📝 عنوان الفيلم
//                     const Text(
//                       "Doctor Strange in the Multiverse\nof Madness",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     const SizedBox(height: 8),
//
//                     /// 📅 سنة الإصدار
//                     const Text(
//                       "2022",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//
//                     const SizedBox(height: 24),
//
//                     /// 🎬 زر Watch
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ColorsManager.lightRed,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {
//                           // TODO: وظيفة الزر
//                         },
//                         child: const Text(
//                           "Watch",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 24),
//
//                     /// 🔢 معلومات (لايك - تعليقات - تقييم)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         _InfoBox(icon: Icons.favorite, label: "15"),
//                         _InfoBox(icon: Icons.comment, label: "90"),
//                         _InfoBox(icon: Icons.star, label: "7.6"),
//                       ],
//                     ),
//
//                     const SizedBox(height: 40),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Screen Shots",style: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 18),)
//
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// ✅ ويدجت للمعلومات الثلاثة (لايك - تعليق - تقييم)
// class _InfoBox extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   const _InfoBox({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: ColorsManager.darkGrey,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.yellowAccent),
//           const SizedBox(width: 6),
//           Text(
//             label,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const MovieDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       extendBodyBehindAppBar: true, // ✅ يخلي الـ AppBar فوق الصورة
//       appBar: AppBar(
//         backgroundColor: Colors.transparent, // ✅ شفاف
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.bookmark_border, color: Colors.white),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               /// ✅ صورة + كل التفاصيل عليها
//               Stack(
//                 children: [
//                   // 🔳 الخلفية
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(0),
//                     child: Image.asset(
//                       imagePath,
//                       width: double.infinity,
//                       height: 450,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//
//                   // 🔲 تظليل
//                   // Container(
//                   //   width: double.infinity,
//                   //   height: 450,
//                   //   decoration: BoxDecoration(
//                   //     color: Colors.black.withOpacity(0.4),
//                   //   ),
//                   // ),
//                   // 🔲 تظليل متدرج من أعلى لأسفل
//                   Container(
//                     width: double.infinity,
//                     height: 450,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.black38, // فوق خفيف
//                           Colors.black54, // متوسط
//                           Colors.black, // تحت غامق
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   // ✅ محتوى فوق الصورة
//                   Positioned.fill(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         /// زر التشغيل
//                         Container(
//                           height: 80,
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                             color: ColorsManager.yellow,
//                             shape: BoxShape.circle,
//                           ),
//                           child: SvgPicture.asset(
//                             SvgAssets.moviePlayIcon,
//                             height: 50,
//                             width: 50,
//                           ),
//                         ),
//
//                         const SizedBox(height: 20),
//
//                         const Text(
//                           "Doctor Strange in the Multiverse\nof Madness",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//
//                         const SizedBox(height: 8),
//
//                         const Text(
//                           "2022",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//
//                         const SizedBox(height: 20),
//
//                         SizedBox(
//                           width: 330,
//                           height: 42,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: ColorsManager.lightRed,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Text(
//                               "Watch",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 20),
//
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 30),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               _InfoBox(icon: Icons.favorite, label: "15"),
//                               _InfoBox(icon: Icons.comment, label: "90"),
//                               _InfoBox(icon: Icons.star, label: "7.6"),
//                             ],
//                           ),
//                         ),
//
//                         const SizedBox(height: 24),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               /// ✅ الجزء التاني
//               SizedBox(height: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                     child: Text(
//                       "Screen Shots",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//
//                   // ✅ صورة 1
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       // border: Border.all(color: Colors.white24),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(ImageAssets.screenShot1),
//                     ),
//                   ),
//
//                   // ✅ صورة 2
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       // border: Border.all(color: Colors.white24),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(ImageAssets.screenShot2),
//                     ),
//                   ),
//
//                   // ✅ صورة 3
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       // border: Border.all(color: Colors.white24),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(ImageAssets.screenShot3),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//                 ],
//               ),
//
//               const SizedBox(height: 40),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(right: 270),
//                     child: Text(
//                       "Similar",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _InfoBox extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   const _InfoBox({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: ColorsManager.darkGrey,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.yellowAccent),
//           const SizedBox(width: 6),
//           Text(label, style: const TextStyle(color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }
///
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const MovieDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.bookmark_border, color: Colors.white),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // 🔳 صورة الفيلم وكل تفاصيلها
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(0),
//                     child: Image.asset(
//                       imagePath,
//                       width: double.infinity,
//                       height: 450,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 450,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [Colors.black38, Colors.black54, Colors.black],
//                       ),
//                     ),
//                   ),
//                   Positioned.fill(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           height: 80,
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                             color: ColorsManager.yellow,
//                             shape: BoxShape.circle,
//                           ),
//                           child: SvgPicture.asset(
//                             SvgAssets.moviePlayIcon,
//                             height: 50,
//                             width: 50,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           "Doctor Strange in the Multiverse\nof Madness",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           "2022",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                         const SizedBox(height: 20),
//                         SizedBox(
//                           width: 330,
//                           height: 42,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: ColorsManager.lightRed,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Text(
//                               "Watch",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 30),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               _InfoBox(icon: Icons.favorite, label: "15"),
//                               _InfoBox(icon: Icons.comment, label: "90"),
//                               _InfoBox(icon: Icons.star, label: "7.6"),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               // 🔲 قسم Screen Shots
//               const SizedBox(height: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                     child: Text(
//                       "Screen Shots",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   for (var img in [
//                     ImageAssets.screenShot1,
//                     ImageAssets.screenShot2,
//                     ImageAssets.screenShot3,
//                   ])
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.white24),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.asset(img),
//                       ),
//                     ),
//                 ],
//               ),
//
//               // 🔲 قسم Similar
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Similar",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     GridView.count(
//                       crossAxisCount: 2,
//                       shrinkWrap: true,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                       physics: const NeverScrollableScrollPhysics(),
//                       childAspectRatio: 2 / 3,
//                       children: const [
//                         _SimilarMovieBox(imagePath: ImageAssets.film1),
//                         _SimilarMovieBox(imagePath: ImageAssets.film1),
//                         _SimilarMovieBox(imagePath: ImageAssets.film1),
//                         _SimilarMovieBox(imagePath: ImageAssets.film1),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Summary",
//                       style: TextStyle(color: ColorsManager.white, fontSize: 22),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ✅ مكونات اللايك، التعليق، التقييم
// class _InfoBox extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   const _InfoBox({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: ColorsManager.darkGrey,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.yellowAccent),
//           const SizedBox(width: 6),
//           Text(label, style: const TextStyle(color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }
//
// // ✅ ويدجت للفيلم في قائمة Similar
// class _SimilarMovieBox extends StatelessWidget {
//   final String imagePath;
//
//   const _SimilarMovieBox({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: Image.asset(imagePath, fit: BoxFit.cover),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const MovieDetailsScreen({
//     super.key,
//     required this.imagePath,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.bookmark_border, color: Colors.white),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               /// ✅ صورة + تفاصيل
//               Stack(
//                 children: [
//                   ClipRRect(
//                     child: Image.asset(
//                       imagePath,
//                       width: double.infinity,
//                       height: 450,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 450,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [Colors.black38, Colors.black54, Colors.black],
//                       ),
//                     ),
//                   ),
//                   Positioned.fill(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           height: 80,
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                             color: ColorsManager.yellow,
//                             shape: BoxShape.circle,
//                           ),
//                           child: SvgPicture.asset(
//                             SvgAssets.moviePlayIcon,
//                             height: 50,
//                             width: 50,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           "Doctor Strange in the Multiverse\nof Madness",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           "2022",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                         const SizedBox(height: 20),
//                         SizedBox(
//                           width: 330,
//                           height: 42,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: ColorsManager.lightRed,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Text(
//                               "Watch",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 30),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               _InfoBox(icon: Icons.favorite, label: "15"),
//                               _InfoBox(icon: Icons.comment, label: "90"),
//                               _InfoBox(icon: Icons.star, label: "7.6"),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               /// ✅ Screen Shots Section
//               const SizedBox(height: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                     child: Text(
//                       "Screen Shots",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ...[
//                     ImageAssets.screenShot1,
//                     ImageAssets.screenShot2,
//                     ImageAssets.screenShot3,
//                   ].map((imagePath) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.asset(imagePath),
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//
//               /// ✅ Similar Section
//               const SizedBox(height: 30),
//               const Padding(
//                 padding: EdgeInsets.only(left: 16.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Similar",
//                     style: TextStyle(
//                       color: ColorsManager.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   shrinkWrap: true,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                   physics: const NeverScrollableScrollPhysics(),
//                   childAspectRatio: 2 / 3,
//                   children: const [
//                     _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 8.2),
//                     _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 7.9),
//                     _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 9.0),
//                     _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 6.7),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Summary",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Text(
//                       "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         height: 1.5,
//                         fontSize: 14,
//                       ),
//                       textAlign: TextAlign.justify,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Column(
//                 children: [
//                   Text(
//                     "Cast",
//                     style: TextStyle(
//                         color: ColorsManager.white,
//                         fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _InfoBox extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   const _InfoBox({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: ColorsManager.darkGrey,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.yellowAccent),
//           const SizedBox(width: 6),
//           Text(label, style: const TextStyle(color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }
//
// class _SimilarMovieBox extends StatelessWidget {
//   final String imagePath;
//   final double rating;
//
//   const _SimilarMovieBox({required this.imagePath, required this.rating});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.asset(
//             imagePath,
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//         ),
//         Positioned(
//           top: 8,
//           left: 8,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.7),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.star, color: Colors.amber, size: 16),
//                 const SizedBox(width: 4),
//                 Text(
//                   rating.toString(),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String imagePath;
  final double rating;

  const MovieDetailsScreen({
    super.key,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.bookmark_border, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ✅ صورة الغلاف
              Stack(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: 450,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 450,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black38, Colors.black54, Colors.black],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: ColorsManager.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            SvgAssets.moviePlayIcon,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Doctor Strange in the Multiverse\nof Madness",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "2022",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 330,
                          height: 42,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.lightRed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Watch",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              _InfoBox(icon: Icons.favorite, label: "15"),
                              _InfoBox(icon: Icons.comment, label: "90"),
                              _InfoBox(icon: Icons.star, label: "7.6"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),

              // ✅ Screen Shots
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Screen Shots",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...[
                    ImageAssets.screenShot1,
                    ImageAssets.screenShot2,
                    ImageAssets.screenShot3,
                  ].map((imagePath) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(imagePath),
                      ),
                    );
                  }).toList(),
                ],
              ),

              // ✅ Similar Movies
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Similar",
                    style: TextStyle(
                      color: ColorsManager.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2 / 3,
                  children: const [
                    _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 8.2),
                    _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 7.9),
                    _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 9.0),
                    _SimilarMovieBox(imagePath: ImageAssets.film1, rating: 6.7),
                  ],
                ),
              ),

              // ✅ Summary
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Summary",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse...",
                      style: TextStyle(
                        color: ColorsManager.white,
                        height: 1.5,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              // ✅ Cast Section
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cast",
                    style: TextStyle(
                      color: ColorsManager.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    _CastBox(
                      imagePath: ImageAssets.avatar1,
                      actorName: "Hayley Atwell",
                      characterName: "Captain Carter",
                    ),
                    _CastBox(
                      imagePath: ImageAssets.avatar2,
                      actorName: "Elizabeth Olsen",
                      characterName: "Wanda Maximoff / The Scarlet Witch",
                    ),
                    _CastBox(
                      imagePath: ImageAssets.avatar3,
                      actorName: "Rachel McAdams",
                      characterName: "Dr. Christine Palmer",
                    ),
                    _CastBox(
                      imagePath: ImageAssets.avatar4,
                      actorName: "Charlize Theron",
                      characterName: "Clea",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "genres",
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ),
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _GenreChip(label: "Action"),
                      _GenreChip(label: "Sci-Fi"),
                      _GenreChip(label: "Adventure"),
                      _GenreChip(label: "Fantasy"),
                      _GenreChip(label: "Horror"),
                    ],
                  ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoBox({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.yellowAccent),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class _SimilarMovieBox extends StatelessWidget {
  final String imagePath;
  final double rating;

  const _SimilarMovieBox({required this.imagePath, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CastBox extends StatelessWidget {
  final String imagePath;
  final String actorName;
  final String characterName;

  const _CastBox({
    required this.imagePath,
    required this.actorName,
    required this.characterName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : $actorName",
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Character : $characterName",
                  style: const TextStyle(
                    color: ColorsManager.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;

  const _GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
