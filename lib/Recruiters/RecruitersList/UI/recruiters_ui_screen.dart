// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../Commons/back_button.dart';
// import '../../../Commons/loading_dialog.dart';
// import '../../../Commons/text_style__constants.dart';
// import '../../../Util/show_toast.dart';
// import '../Bloc/recruiters_bloc.dart';
// import '../Model/recruiters_list_model.dart';
//
//
// class RecruitersScreen extends StatefulWidget {
//   //final int courserId;
//
//   const RecruitersScreen({Key? key,
// // required this.courserId
// }) : super(key: key);
//
//   @override
//   _RecruitersScreenState createState() => _RecruitersScreenState();
// }
//
// class _RecruitersScreenState extends State<RecruitersScreen> {
//   final RecruitersBLoc _bloc = RecruitersBLoc();
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc.fetchDataFromApi(
// /*widget.courserId*/
// );
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
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//             navigateToMainScreen(context);
//           },
//         ),
//         title: const Text('Placement Calls'),
//       ),
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.recruitersStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final dataList = snapshot.data!;
//             return ListView.builder(
//               itemCount: dataList.length,
//               itemBuilder: (context, index) {
//                 final show = dataList[index];
//                 return InkWell(
//                   onTap: () {
//                     showToast('Clicked');
//                     // Navigator.push(
//                     //   context,
//                       // MaterialPageRoute(
//                       //   builder: (context) => PlacementScreen(courseId: show.recruitmentCallCourseId!,),
//                       // ),
//                  //   );
//                   },
//                   child: Card(
//                     margin: const EdgeInsets.all(7),
//                     child: Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Container(
//                           //   margin: const EdgeInsets.only(top: 10, bottom: 5), // Add top margin to move it down
//                           //   // alignment: Alignment.lerp(Alignment.center, Alignment.bottomCenter, 0.90)!,
//                           //   width: 80,
//                           //   height: 80,
//                           //
//                           // ),
//                           // Container(
//                           //   margin: EdgeInsets.all(5),
//                           //   alignment: Alignment.lerp(Alignment.center,Alignment.topRight,0.80)!,
//                           //   width: 80,
//                           //   height: 80,
//                           //   child: Image.network(
//                           //     '${show.imageUrl}',
//                           //     fit: BoxFit.contain,
//                           //     // Adjust the fit property
//                           //   ),
//                           // ),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   '${show.title}',
//                                   style: TextStyleConstants.titleStyle,
//                                 ),
//                                 const SizedBox(height: 20),
//                                 // Expanded(child:
//                                 // Text(
//                                 //   '${show.description}',
//                                 //   style: TextStyleConstants.regularStyle,
//                                 // ),
//                                 // ),
//                                 const SizedBox(height: 5),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       '${show.companyName}',
//                                       style: TextStyleConstants.regularStyle,
//                                     ),
//                                     Text('${show.companyCity}'),
//                                   ],
//                                 ),
//                                 Text('${show.companyContactNumber}'),
//                                 Text('${show.companyEmail}'),
//                                 const SizedBox(height: 9),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
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
// }
// /*
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:your_app/common/text_style_constants.dart';
// import 'package:your_app/util/show_toast.dart';
// import 'recruiters_bloc.dart';
// import 'recruiters_list_model.dart';
//
// class ExpandableCard extends StatefulWidget {
//   final Data data;
//   final bool isExpanded;
//   final VoidCallback onTap;
//
//   ExpandableCard({required this.data, this.isExpanded = false, required this.onTap});
//
//   @override
//   _ExpandableCardState createState() => _ExpandableCardState();
// }
//
// class _ExpandableCardState extends State<ExpandableCard> {
//   bool isExpanded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     isExpanded = widget.isExpanded;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         widget.onTap(); // Notify the parent widget that this card was tapped
//       },
//       child: Card(
//         margin: const EdgeInsets.all(7),
//         child: Padding(
//           padding: const EdgeInsets.all(5),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text(
//                       '${widget.data.title}',
//                       style: TextStyleConstants.titleStyle,
//                     ),
//                     const SizedBox(height: 20),
//                     if (isExpanded) // Show description when expanded
//                       Text(
//                         '${widget.data.description}',
//                         style: TextStyleConstants.regularStyle,
//                       ),
//                     const SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Text(
//                           '${widget.data.companyName}',
//                           style: TextStyleConstants.regularStyle,
//                         ),
//                         Text('${widget.data.companyCity}'),
//                       ],
//                     ),
//                     Text('${widget.data.companyContactNumber}'),
//                     Text('${widget.data.companyEmail}'),
//                     const SizedBox(height: 9),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RecruitersScreen extends StatefulWidget {
//   const RecruitersScreen({Key? key}) : super(key: key);
//
//   @override
//   _RecruitersScreenState createState() => _RecruitersScreenState();
// }
//
// class _RecruitersScreenState extends State<RecruitersScreen> {
//   final RecruitersBLoc _bloc = RecruitersBLoc();
//   int? expandedCardIndex; // Store the index of the expanded card
//
//   @override
//   void initState() {
//     super.initState();
//     expandedCardIndex = null; // No card initially expanded
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
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Placement Calls'),
//       ),
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.recruitersStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final dataList = snapshot.data!;
//             return ListView.builder(
//               itemCount: dataList.length,
//               itemBuilder: (context, index) {
//                 final show = dataList[index];
//                 return ExpandableCard(
//                   data: show,
//                   isExpanded: expandedCardIndex == index, // Check if this card should be expanded
//                   onTap: () {
//                     setState(() {
//                       if (expandedCardIndex == index) {
//                         // If the same card is tapped, shrink it
//                         expandedCardIndex = null;
//                       } else {
//                         // If a different card is tapped, expand it
//                         expandedCardIndex = index;
//                       }
//                     });
//                   },
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error fetching data: ${snapshot.error}'),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// */
import 'package:flutter/material.dart';
import '../Model/recruiters_list_model.dart';
import '../../../Commons/text_style__constants.dart';
import '../Bloc/recruiters_bloc.dart';


class ExpandableCard extends StatefulWidget {
  final Data data;
  final bool isExpanded;
  final VoidCallback onTap;

  ExpandableCard({required this.data, this.isExpanded = false, required this.onTap});

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(); // Notify the parent widget that this card was tapped
      },
      child: Card(
        margin: const EdgeInsets.all(7),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${widget.data.title}',
                      style: TextStyleConstants.titleStyle,
                    ),
                    const SizedBox(height: 20),
                    if (isExpanded) // Show description when expanded
                      Text(
                        '${widget.data.description}',
                        style: TextStyleConstants.regularStyle,
                      ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '${widget.data.companyName}',
                          style: TextStyleConstants.regularStyle,
                        ),
                        Text('${widget.data.companyCity}'),
                      ],
                    ),
                    Text('${widget.data.companyContactNumber}'),
                    Text('${widget.data.companyEmail}'),
                    const SizedBox(height: 9),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecruitersScreen extends StatefulWidget {
  const RecruitersScreen({Key? key}) : super(key: key);

  @override
  _RecruitersScreenState createState() => _RecruitersScreenState();
}

class _RecruitersScreenState extends State<RecruitersScreen> {
  final RecruitersBLoc _bloc = RecruitersBLoc();
  int? expandedCardIndex; // Store the index of the expanded card

  @override
  void initState() {
    super.initState();
    expandedCardIndex = null; // No card initially expanded
    _bloc.fetchDataFromApi();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placement Calls'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.recruitersStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final show = dataList[index];
                return ExpandableCard(
                  data: show,
                  isExpanded: expandedCardIndex == index, // Check if this card should be expanded
                  onTap: () {
                    setState(() {
                      if (expandedCardIndex == index) {
                        // If the same card is tapped, shrink it
                        expandedCardIndex = null;
                      } else {
                        // If a different card is tapped, expand it
                        expandedCardIndex = index;
                      }
                    });
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
