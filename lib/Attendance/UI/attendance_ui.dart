// /*
// import 'package:flutter/material.dart';
// import '../../Commons/loading_dialog.dart';
// import '../Bloc/attendance_bloc.dart';
// import '../Model/attendance_model.dart';
//
// class AttendanceUI extends StatefulWidget {
//
//   // final int enrollmentId;
//
//   const AttendanceUI({Key? key, }) : super(key: key);
//
//   @override
//   AttendanceUIState createState() => AttendanceUIState();
// }
//
// class AttendanceUIState extends State<AttendanceUI> {
//   final StudentAttendanceBloc _bloc = StudentAttendanceBloc();
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
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Attendance'),
//       ),
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.attendanceDetailsStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Data> attendanceList = snapshot.data!;
//             return ListView.builder(
//               itemCount: attendanceList.length,
//               itemBuilder: (context, index) {
//                 Data attendanceData = attendanceList[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 3, // Add some elevation for a box effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Title: Your Title Here',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text('Date: ${attendanceData.attendanceDate ?? ''}'),
//                           Text('Remark: ${attendanceData.remark ?? ''}'),
//                           Text('In Time: ${attendanceData.tIMEFORMATBsaInTimeHI ?? ''}'),
//                           Text('Out Time: ${attendanceData.tIMEFORMATBsaOutTimeHI ?? ''}'),
//                           Text('Status: ${attendanceData.isOnline ?? ''}'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text('Error fetching attendance data'),
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



import 'package:flutter/material.dart';
import '../../Commons/loading_dialog.dart';
import '../Bloc/attendance_bloc.dart';
import '../Model/attendance_model.dart';
import '../Bloc/attendance_bloc.dart';

class AttendanceUI extends StatefulWidget {

  // final int enrollmentId;

  const AttendanceUI({Key? key, }) : super(key: key);

  @override
  AttendanceUIState createState() => AttendanceUIState();
}

class AttendanceUIState extends State<AttendanceUI> {
  final StudentAttendanceBloc _bloc = StudentAttendanceBloc();
  // final StudentAttendanceBloc _bloc = StudentAttendanceBloc();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Attendance'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.attendanceDetailsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Data> attendanceList = snapshot.data!;
            return ListView.builder(
              itemCount: attendanceList.length,
              itemBuilder: (context, index) {
                Data attendanceData = attendanceList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3, // Add some elevation for a box effect
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Title: Your Title Here',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Date: ${attendanceData.attendanceDate ?? ''}'),
                          Text('Remark: ${attendanceData.remark ?? ''}'),
                          Text('In Time: ${attendanceData.tIMEFORMATBsaInTimeHI ?? ''}'),
                          Text('Out Time: ${attendanceData.tIMEFORMATBsaOutTimeHI ?? ''}'),
                          Text('Status: ${attendanceData.isOnline ?? ''}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching attendance data'),
            );
          } else {
            return const Center(
              child: LoadingDialog(),
            );
          }
        },
      ),
    );
  }
}