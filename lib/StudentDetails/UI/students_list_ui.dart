// /*
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:html/parser.dart' as htmlParser;
// import 'package:html/dom.dart' as dom;
// import '../../../../../Commons/back_button.dart';
// import '../../../../../Commons/drawer_state_provider.dart';
// import '../../../../Commons/text_style__constants.dart';
// import '../../../../Util/show_toast.dart';
// import '../../../Commons/loading_dialog.dart';
// import '../Model/student_details_model.dart';
// import '../Bloc/student_details_list.dart';
//
// class StudentDetailInformation extends StatefulWidget {
//   const StudentDetailInformation({Key? key}) : super(key: key);
//
//   @override
//   _StudentDetailInformationState createState() => _StudentDetailInformationState();
// }
//
// class _StudentDetailInformationState extends State<StudentDetailInformation> {
//   final GetStudentsDetailsInfo _bloc = GetStudentsDetailsInfo();
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc.fetchDataFromApi();
//   }
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isDrawerOpen = Provider.of<DrawerStateProvider>(context).isDrawerOpen;
//
//     return Scaffold(
//       appBar: AppBar(
//
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//             //navigateToMainScreen(context); // You might need to define this function
//           },
//         ),
//         title: const Text('News'),
//       ),
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.getStudentStream,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text('Error fetching data'),
//             );
//           } else if (snapshot.hasData) {
//             final newsDetailsList = snapshot.data!;
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: newsDetailsList.map((data) {
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 9),
//                           Text(
//                             '${data.studentName}',
//                             style: TextStyleConstants.regularStyle,
//                           ),
//                           const SizedBox(height: 9),
//                           Text(
//                             '${data.birthDate}',
//                             style: TextStyleConstants.regularStyle,
//                           ),
//                           const SizedBox(height: 9),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error fetching data: ${snapshot.error}'),
//             );
//           } else {
//             return const Center(
//               child: LoadingDialog(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }*/

/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../../../Commons/back_button.dart';
import '../../../../../Commons/drawer_state_provider.dart';
import '../../../../Commons/text_style__constants.dart';
import '../../../../Util/show_toast.dart';
import '../../../Commons/loading_dialog.dart';
import '../Model/student_details_model.dart';
import '../Bloc/student_details_list.dart';

class StudentDetailInformation extends StatefulWidget {
  const StudentDetailInformation({Key? key}) : super(key: key);

  @override
  _StudentDetailInformationState createState() => _StudentDetailInformationState();
}

class _StudentDetailInformationState extends State<StudentDetailInformation> {
  final GetStudentsDetailsInfo _bloc = GetStudentsDetailsInfo();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDrawerOpen = Provider
        .of<DrawerStateProvider>(context)
        .isDrawerOpen;

    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          elevation: 6,
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp, color: Colors.blueGrey,),
            onPressed: () {
              Navigator.pop(context);
              navigateToMainScreen(
                  context); // You might need to define this function
            },
          ),

          title: Text(
              'View Student Profile', style: TextStyleConstants.regularStyle),
        ),
        body: StreamBuilder<List<Data>>(
          stream: _bloc.getStudentStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error fetching data'),
              );
            } else if (snapshot.hasData) {
              final newsDetailsList = snapshot.data!;
              return ListView(
                children: newsDetailsList.map((data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Center(
                        child: Text('Student Details', style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 4,
                                  color: Theme
                                      .of(context)
                                      .scaffoldBackgroundColor,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black54,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Theme
                                        .of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  color: Colors.blueGrey,
                                ),
                                child: const Icon(Icons.edit),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(thickness: 0.8, indent: 15, endIndent: 15,),
                      Container(
                        // adjust the height as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // SizedBox(width: 10),
                            Text(
                              'Student Name',
                              style: TextStyleConstants.regularStyle,
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${data.studentName}',
                              style: TextStyleConstants.regularStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error fetching data: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: LoadingDialog(),
              );
            }
          },
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Commons/back_button.dart';
import '../../../../../Commons/drawer_state_provider.dart';
import '../../../../Commons/text_style__constants.dart';
import '../../../Commons/loading_dialog.dart';
import '../Model/student_details_model.dart';
import '../Bloc/student_details_list.dart';

class StudentDetailInformation extends StatefulWidget {
  const StudentDetailInformation({Key? key}) : super(key: key);

  @override
  _StudentDetailInformationState createState() => _StudentDetailInformationState();
}

class _StudentDetailInformationState extends State<StudentDetailInformation> {
  final GetStudentsDetailsInfo _bloc = GetStudentsDetailsInfo();
  // late Data data;

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  /*Text getGenderStatus() {

    if (data.gender == 0) {
      return const Text('Male');
    }  else {
      return const Text('Female');
    }
  // }*/
  // String getStatus() {
  //   switch (status) {
  //     case 1:
  //       return 'Started';
  //     case 2:
  //       return 'Not Started';
  //     default:
  //       return 'Unknown status';
  //   }
  // }
  // String getGenderStatus() {
  //   late Data data;
  //   if ('${data.gender'}) {
  //     return 'Male';
  //   } else {
  //     return 'Female';
  //   }
  // }

  String getGenderStatus(List<Data> dataList) {
    if (dataList.isNotEmpty) {
      return dataList[0].gender == 0 ? 'Male' : 'Female';
    }
    return 'Unknown';
  }


  @override
  Widget build(BuildContext context) {
    final isDrawerOpen = Provider
        .of<DrawerStateProvider>(context)
        .isDrawerOpen;

    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          elevation: 6,
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp, color: Colors.blueGrey,),
            onPressed: () {
              Navigator.pop(context);
              navigateToMainScreen(
                  context); // You might need to define this function
            },
          ),

          title: Text(
              'View Student Profile', style: TextStyleConstants.regularStyle),
        ),
        body: StreamBuilder<List<Data>>(
          stream: _bloc.getStudentStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error fetching data'),
              );
            } else if (snapshot.hasData) {
              final newsDetailsList = snapshot.data!;
              return ListView(
                children: newsDetailsList.map((data) {
                  return Container(
                    height: MediaQuery.of(context).size.height*0.45,
                      width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        const SizedBox(height: 15),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 4,
                                    color: Theme
                                        .of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black54,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image:  const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        /*'${data.imageUrl}'*/
                                      'https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250',
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme
                                          .of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.blueGrey,
                                  ),
                                  child: const Icon(Icons.edit),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(thickness: 0.8, indent: 15, endIndent: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(width: 20),
                            Text(
                              'Student Name',
                              style: TextStyleConstants.regularStyle,
                            ),
                            const SizedBox(height: 5),
                            Text('${data.studentName}',
                              style: TextStyleConstants.regularStyle,
                            ),
                            const SizedBox(height: 5),
                            Text("Gender:",style: TextStyleConstants.regularStyle,),
                            const SizedBox(height: 5),
                            Text(getGenderStatus(newsDetailsList)),

                            // Text(getGenderStatus()),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error fetching data: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: LoadingDialog(),
              );
            }
          },
        ),
      ),
    );
  }
}