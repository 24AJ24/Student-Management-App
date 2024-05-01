/*

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Bitcode Technology',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Version 1.0.0'),
                  SizedBox(height: 20),
                  Text(
                    'At BitCode, we believe there is a better way to teach technology! We are the trend setters in IT training and known for the result oriented approach. We are completely focused on the quality of training and building innovative approach in our students. With BitCode you always Win.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width > 600 ? 16 : 14,
                    ),
                  ),
                  SizedBox(height: 20),


                 Image(image:AssetImage('image/four.jpg')),
                  // Image.asset(
                  //   'images/training.jpg',
                  //   width: MediaQuery.of(context).size.width > 600 ? 300 : 200,
                  // ),
                  Text('Bitcode Technology'),
                  Text('Website: www.xyzcompany.com'),
                  Text('Email: info@xyzcompany.com'),
                  SizedBox(height: 20),
                  Text(
                    'Legal Information:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Privacy Policy'),
                  Text('Terms of Service'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        '© 2023 XYZ Inc. All Rights Reserved',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class AboutScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor: Colors.transparent,
//       systemNavigationBarIconBrightness: Brightness.light,
//     ));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About'),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Bitcode Technology',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text('Version 1.0.0'),
//                   SizedBox(height: 20),
//                   Text(
//                     'At BitCode, we believe there is a better way to teach technology! We are the trend setters in IT training and known for the result oriented approach. We are completely focused on the quality of training and building innovative approach in our students. With BitCode you always Win.',
//                     style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.width > 600 ? 16 : 14,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//
//                   Image(image:AssetImage('image/four.jpg',),),// Image
//                   // Image.asset(
//                   //   'images/four.jpg',
//                   //   width: MediaQuery.of(context).size.width > 600 ? 300 : 200,
//                   // ),
//                   Text('Bitcode Technology'),
//                   Text('Website: www.xyzcompany.com'),
//                   Text('Email: info@xyzcompany.com'),
//                   SizedBox(height: 20),
//                   Text(
//                     'Legal Information:',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text('Privacy Policy'),
//                   Text('Terms of Service'),
//                 ],
//               ),
//             ),
//             // Row(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //   children: [
//             //   Image(image:AssetImage('image/four.jpg',),width: MediaQuery.of(context).size.width > 600 ? 300 : 200,),
//             //     Text(
//             //                     'Founder & CEO',
//             //                     style: TextStyle(
//             //                       fontSize: 20,
//             //                       fontWeight: FontWeight.bold,
//             //                     ),
//             //                   ),
//             //   ],
//             // ),
//             // Founder & CEO Section
//             Expanded(
//
//               child: Column(
//
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   Container(
//
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//
//                         Text(
//                           'Founder & CEO',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Image(image:AssetImage('image/four.jpg',),width: MediaQuery.of(context).size.width > 600 ? 300 : 200,),
//                         // Add Photo and Description for Founder & CEO
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Co-Founder & MD Section
//             // Expanded(
//             //   child: Column(
//             //     mainAxisAlignment: MainAxisAlignment.end,
//             //     children: <Widget>[
//             //       Container(
//             //         padding: EdgeInsets.all(20),
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: <Widget>[
//             //             Text(
//             //               'Co-Founder & MD',
//             //               style: TextStyle(
//             //                 fontSize: 20,
//             //                 fontWeight: FontWeight.bold,
//             //               ),
//             //             ),
//             //             // Add Photo and Description for Co-Founder & MD
//             //           ],
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             // Copyright
//             Container(
//               color: Colors.blue,
//               padding: EdgeInsets.all(20),
//               child: Center(
//                 child: Text(
//                   '© 2023 XYZ Inc. All Rights Reserved',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
*/






import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      // systemNavigationBarColor: Colors.transparent,
      // systemNavigationBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bitcode Technology',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Version 1.0.0'),
              SizedBox(height: 20),
              Text(
                'At BitCode, we believe there is a better way to teach technology! We are the trend setters in IT training and known for the result oriented approach. We are completely focused on the quality of training and building innovative approach in our students. With BitCode you always Win.',
                style: TextStyleConstants.regularStyle,
                  // fontSize: MediaQuery.of(context).size.width > 600 ? 16 : 14,

              ),
              SizedBox(height: 20),
              Image.asset(
                'image/four.jpg',
                // width: MediaQuery.of(context).size.width > 600 ? 300 : 200,
              ),
              // Text('Bitcode Technology'),
              // Text('Website: www.xyzcompany.com'),
              // Text('Email: info@xyzcompany.com'),
              SizedBox(height: 20),
              // Text(
              //   'Legal Information:',
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // Text('Privacy Policy'),
              // Text('Terms of Service'),
              // SizedBox(height: 20),
              Text(
                'Founder & CEO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'image/five.jpg',
                width: MediaQuery.of(context).size.width > 600 ? 300 : 200,
              ),
              // Add Photo and Description for Founder & CEO
              SizedBox(height: 20),
              // Co-Founder & MD Section
              Text(
                'Co-Founder & MD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'image/six.jpg',
                width: MediaQuery.of(context).size.width > 600 ? 300 : 200,
              ),
              // Add Photo and Description for Co-Founder & MD
              SizedBox(height: 20),
              // Copyright
          Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  '© 2023 XYZ Inc. All Rights Reserved',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
              // Container(
              //   color: Colors.blue,
              //   padding: EdgeInsets.all(20),
              //   child: Center(
              //     child: Text(
              //       '© 2023 XYZ Inc. All Rights Reserved',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
