// import 'package:flutter/material.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
// import 'package:my_movie_app/core/widgets/custom_text_button.dart';
// import 'package:my_movie_app/core/widgets/custom_text_form_field.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManager.darkGrey,
//       body: Container(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 40,
//                         backgroundImage: AssetImage(ImageAssets.avatar1),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         "John Safwat",
//                         style: TextStyle(
//                           color: ColorsManager.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: const [
//                         Text(
//                           "12",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "Watch List",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: const [
//                         Text(
//                           "10",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "History",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   // زر Edit Profile
//                   Expanded(
//                     flex: 2,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: ColorsManager.yellow,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         "Edit Profile",
//                         style: TextStyle(color: ColorsManager.black, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   // زر Logout
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: ColorsManager.lightRed,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         "Exit",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 5,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Icon(Icons.playlist_add_outlined,size: 40,color: ColorsManager.yellow,),
//                     SizedBox(height: 7,),
//                     Text("Watch",style: TextStyle(color: ColorsManager.white,fontSize: 16),),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.history,size: 40,color: ColorsManager.white,),
//                     SizedBox(height: 7,),
//                     Text("History",style: TextStyle(color: ColorsManager.white,fontSize: 16),)
//                   ],
//                 )
//
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   String _currentView = 'watch'; // 'watch' or 'history'
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManager.darkGrey,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundImage: AssetImage(ImageAssets.avatar1),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       "John Safwat",
//                       style: TextStyle(
//                         color: ColorsManager.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const [
//                       Text(
//                         "12",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "Watch List",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const [
//                       Text(
//                         "10",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "History",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 30),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ColorsManager.yellow,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Edit Profile",
//                       style: TextStyle(
//                           color: ColorsManager.black, fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ColorsManager.lightRed,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Exit",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           // ✅ Row with icons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _currentView = 'watch';
//                   });
//                 },
//                 child: Column(
//                   children: [
//                     Icon(
//                       Icons.playlist_add_outlined,
//                       size: 40,
//                       color: _currentView == 'watch'
//                           ? ColorsManager.yellow
//                           : ColorsManager.white,
//                     ),
//                     const SizedBox(height: 7),
//                     Text(
//                       "Watch",
//                       style: TextStyle(
//                           color: _currentView == 'watch'
//                               ? ColorsManager.yellow
//                               : ColorsManager.white,
//                           fontSize: 16
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _currentView = 'history';
//                   });
//                 },
//                 child: Column(
//                   children: [
//                     Icon(
//                       Icons.history,
//                       size: 40,
//                       color: _currentView == 'history'
//                           ? ColorsManager.yellow
//                           : ColorsManager.white,
//                     ),
//                     const SizedBox(height: 7),
//                     Text(
//                       "History",
//                       style: TextStyle(
//                           color: _currentView == 'history'
//                               ? ColorsManager.yellow
//                               : ColorsManager.white,
//                           fontSize: 16
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           // Movies Container
//           Expanded(
//             child: Container(
//
//               margin: const EdgeInsets.symmetric(horizontal: 0),
//               decoration: BoxDecoration(
//                 color: ColorsManager.black,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: ColorsManager.black, width: 1),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text(
//                       _currentView == 'watch' ? 'Watch List' : 'History',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: ColorsManager.white,
//                       ),
//                     ),
//                   ),
//                   const Divider(color: Colors.white24),
//                   Expanded(
//                     child: _buildMovieList(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMovieList() {
//     List<Map<String, String>> movies = [
//       {"title": "Inception", "image": ImageAssets.film1},
//       {"title": "Interstellar", "image": ImageAssets.film1},
//       {"title": "The Matrix", "image": ImageAssets.film1},
//       {"title": "The Dark Knight", "image": ImageAssets.film1},
//       {"title": "John Wick", "image": ImageAssets.film1},
//     ];
//
//     return ListView.separated(
//       padding: const EdgeInsets.all(8),
//       itemCount: movies.length,
//       separatorBuilder: (context, index) => const Divider(color: Colors.white24),
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.asset(
//                   movies[index]["image"]!,
//                   height: 60,
//                   width: 60,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   movies[index]["title"]!,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   _currentView == 'watch'
//                       ? Icons.play_circle_outline
//                       : Icons.delete_outline,
//                   color: ColorsManager.yellow,
//                   size: 30,
//                 ),
//                 onPressed: () {
//                   // Add action here
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   String _currentView = 'watch'; // 'watch' or 'history'
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManager.darkGrey,
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 40,
//                           backgroundImage: AssetImage(ImageAssets.avatar1),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           "John Safwat",
//                           style: TextStyle(
//                             color: ColorsManager.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Text(
//                             "12",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "Watch List",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Text(
//                             "10",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "History",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ColorsManager.yellow,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const Text(
//                           "Edit Profile",
//                           style: TextStyle(
//                               color: ColorsManager.black, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ColorsManager.lightRed,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const Text(
//                           "Exit",
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // ✅ Row with icons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _currentView = 'watch';
//                       });
//                     },
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.playlist_add_outlined,
//                           size: 40,
//                           color: _currentView == 'watch'
//                               ? ColorsManager.yellow
//                               : ColorsManager.white,
//                         ),
//                         const SizedBox(height: 7),
//                         Text(
//                           "Watch",
//                           style: TextStyle(
//                               color: _currentView == 'watch'
//                                   ? ColorsManager.yellow
//                                   : ColorsManager.white,
//                               fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _currentView = 'history';
//                       });
//                     },
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.history,
//                           size: 40,
//                           color: _currentView == 'history'
//                               ? ColorsManager.yellow
//                               : ColorsManager.white,
//                         ),
//                         const SizedBox(height: 7),
//                         Text(
//                           "History",
//                           style: TextStyle(
//                               color: _currentView == 'history'
//                                   ? ColorsManager.yellow
//                                   : ColorsManager.white,
//                               fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Movies Container
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.5, // Fixed height for scroll
//                 margin: const EdgeInsets.symmetric(horizontal: 0),
//                 decoration: BoxDecoration(
//                   color: ColorsManager.black,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: ColorsManager.black, width: 1),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         _currentView == 'watch' ? 'Watch List' : 'History',
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: ColorsManager.white,
//                         ),
//                       ),
//                     ),
//                     const Divider(color: Colors.white24),
//                     Expanded(
//                       child: _buildMovieList(),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMovieList() {
//     List<Map<String, String>> movies = [
//       {"title": "Inception", "image": ImageAssets.film1},
//       {"title": "Interstellar", "image": ImageAssets.film1},
//       {"title": "The Matrix", "image": ImageAssets.film1},
//       {"title": "The Dark Knight", "image": ImageAssets.film1},
//       {"title": "John Wick", "image": ImageAssets.film1},
//     ];
//
//     return ListView.separated(
//       padding: const EdgeInsets.all(8),
//       itemCount: movies.length,
//       separatorBuilder: (context, index) => const Divider(color: Colors.white24),
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.asset(
//                   movies[index]["image"]!,
//                   height: 60,
//                   width: 60,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   movies[index]["title"]!,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   _currentView == 'watch'
//                       ? Icons.play_circle_outline
//                       : Icons.delete_outline,
//                   color: ColorsManager.yellow,
//                   size: 30,
//                 ),
//                 onPressed: () {
//                   // Add action here
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// // }


// import 'package:flutter/material.dart';
// import 'package:my_movie_app/core/resources/assets_manager.dart';
// import 'package:my_movie_app/core/resources/colors_manager.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   String _currentView = 'watch'; // 'watch' or 'history'
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManager.darkGrey,
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 40,
//                           backgroundImage: AssetImage(ImageAssets.avatar1),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           "John Safwat",
//                           style: TextStyle(
//                             color: ColorsManager.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Text(
//                             "12",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "Watch List",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Text(
//                             "10",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "History",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ColorsManager.yellow,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const Text(
//                           "Edit Profile",
//                           style: TextStyle(
//                               color: ColorsManager.black,
//                               fontSize: 16
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ColorsManager.lightRed,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const Text(
//                           "Exit",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Toggle between Watch and History
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _currentView = 'watch';
//                       });
//                     },
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.playlist_add_outlined,
//                           size: 40,
//                           color: _currentView == 'watch'
//                               ? ColorsManager.yellow
//                               : ColorsManager.white,
//                         ),
//                         const SizedBox(height: 7),
//                         Text(
//                           "Watch",
//                           style: TextStyle(
//                               color: _currentView == 'watch'
//                                   ? ColorsManager.yellow
//                                   : ColorsManager.white,
//                               fontSize: 16
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _currentView = 'history';
//                       });
//                     },
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.history,
//                           size: 40,
//                           color: _currentView == 'history'
//                               ? ColorsManager.yellow
//                               : ColorsManager.white,
//                         ),
//                         const SizedBox(height: 7),
//                         Text(
//                           "History",
//                           style: TextStyle(
//                               color: _currentView == 'history'
//                                   ? ColorsManager.yellow
//                                   : ColorsManager.white,
//                               fontSize: 16
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Movies Grid Section
//               Container(
//                 color: ColorsManager.black,
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     // Text(
//                     //   _currentView == 'watch' ? 'Watch List' : 'History',
//                     //   style: const TextStyle(
//                     //     fontSize: 22,
//                     //     fontWeight: FontWeight.bold,
//                     //     color: ColorsManager.white,
//                     //   ),
//                     // ),
//                     _buildMovieGrid(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMovieGrid() {
//     List<String> movieImages = List.filled(12, ImageAssets.film1); // 12 example movies
//
//     return GridView.builder(
//
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         childAspectRatio: 0.7,
//       ),
//       itemCount: movieImages.length,
//       itemBuilder: (context, index) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.asset(
//             movieImages[index],
//             fit: BoxFit.cover,
//           ),
//         );
//       },
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';

import '../../profile_update/profile_update.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _currentView = 'watch'; // 'watch' or 'history'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkGrey,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(ImageAssets.avatar1),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "John Safwat",
                          style: TextStyle(
                            color: ColorsManager.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Watch List",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "10",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "History",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileUpdate()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.yellow,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: ColorsManager.black,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.lightRed,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Exit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.logout, color: ColorsManager.white),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Toggle between Watch and History
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentView = 'watch';
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.playlist_add_outlined,
                          size: 40,
                          color: _currentView == 'watch'
                              ? ColorsManager.yellow
                              : ColorsManager.white,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          "Watch",
                          style: TextStyle(
                              color: _currentView == 'watch'
                                  ? ColorsManager.yellow
                                  : ColorsManager.white,
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentView = 'history';
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.history,
                          size: 40,
                          color: _currentView == 'history'
                              ? ColorsManager.yellow
                              : ColorsManager.white,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          "History",
                          style: TextStyle(
                              color: _currentView == 'history'
                                  ? ColorsManager.yellow
                                  : ColorsManager.white,
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Movies Grid Section
              Container(
                color: ColorsManager.black,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    const SizedBox(height: 16),
                    _buildMovieGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieGrid() {
    List<String> movieImages = List.filled(12, ImageAssets.film1); // 12 example movies

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: movieImages.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            movieImages[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
