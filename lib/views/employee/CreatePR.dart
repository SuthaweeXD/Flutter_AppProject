// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class CreatePR extends StatefulWidget {
//   CreatePR({Key? key}) : super(key: key);

//   @override
//   State<CreatePR> createState() => _CreatePRState();
// }

// class _CreatePRState extends State<CreatePR> {
//  File? _image;
//   bool isTapped = false;
//   TextEditingController description = TextEditingController();
//   @override
  

//   Future getImage(ImageSource imggallary) async {
//     final image = await ImagePicker().pickImage(source: imggallary);
//     if (image == null) return;

//     final imageTemporary = File(image.path);
//     setState(() {
//       this._image = imageTemporary;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ประชาสัมพันธ์'),
//         backgroundColor: const Color.fromARGB(255, 45, 134, 156),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: description,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0))),
//               ),
//               SizedBox(height: 20),

//               _image != null
//                   ? SizedBox.fromSize(
//                       child: Container(
//                           padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
//                           child: Image.file(
//                             _image!,
//                           )),
//                     )
//                   : widget.data['pr_photo'] != null
//                       ? SizedBox.fromSize(
//                           child: Container(
//                               padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
//                               child: Image(
//                                   image: NetworkImage(
//                                     widget.data['pr_photo'],
//                                   ),
//                                   fit: BoxFit.cover)),
//                         )
//                       : SizedBox.fromSize(
//                           child: Container(
//                             padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
//                             child: Image.asset(
//                               'assets/images/empty.png',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),

//               ///
//               SizedBox(
//                 width: 350,
//                 height: 80,
//               ),

//               ////
//               Container(
//                 padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     getImage(ImageSource.gallery);
//                   },
//                   child: Row(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       // ignore: prefer_const_constructors
//                       Icon(
//                         Icons.photo,
//                         size: 30,
//                         color: Colors.grey,
//                       ),
//                       // ignore: prefer_const_constructors
//                       SizedBox(
//                         width: 20,
//                       ),
//                       const Text('อัปโหลดรูปภาพ',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 6, 6, 6),
//                               fontSize: 22,
//                               fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 40),
//                     primary: Color.fromARGB(255, 108, 235, 255),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               _image != null
//                   ? Container(
//                       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (!isTapped) {
//                             isTapped = true;
//                             uploadPR(
//                                 _image!,
//                                 widget.data['pr_id'],
//                                 description.text,
//                                 DateTime.now().toString(),
//                                 context);
//                           }
//                         },
//                         child: Row(
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             // ignore: prefer_const_constructors
//                             Icon(Icons.payments, size: 30, color: Colors.grey),
//                             // ignore: prefer_const_constructors
//                             SizedBox(
//                               width: 20,
//                             ),
//                             const Text('บันทึกประชาสัมพันธ์',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500)),
//                           ],
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           shape: const RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 40),
//                           primary: Color.fromARGB(255, 0, 255, 55),
//                         ),
//                       ),
//                     )
//                   : Text(''),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }