import 'package:bitcode_student_app/Attendance/UI/attendance_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../Commons/back_button.dart';
import '../../Commons/loading_dialog.dart';
import '../../Commons/text_style__constants.dart';
import '../BLoc/batch_bloc.dart';
import '../Model/batch_request_model.dart';

class BatchDetailsUI extends StatefulWidget {
  const BatchDetailsUI({Key? key}) : super(key: key);

  @override
  _BatchDetailsUIState createState() => _BatchDetailsUIState();
}

class _BatchDetailsUIState extends State<BatchDetailsUI> {
  // bool isDrawerOpen = false;
  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  List<Data> batchDetailsList = [];
  final BatchDetailsBloc _bloc = BatchDetailsBloc();

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
    double spacingInDp = 10; // Adjust this value as needed for your spacing
    double textsizeInDp = 20;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(CupertinoIcons.arrow_left),
          // icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(context);
          },
        ),
        title: const Text('Batch Details'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.batchDetailsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            batchDetailsList = snapshot.data!;
            return GroupedListView<Data, String>(
              elements: batchDetailsList,
              groupBy: (data) => data.batchTitle.toString(),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                  height: spacingInDp *
                      MediaQuery.of(context)
                          .textScaleFactor), // Convert to actual pixels
              itemBuilder: (context, data) => BatchRow(
                data: data,
                spacingInDp: spacingInDp,
              ),
              order: GroupedListOrder.ASC,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data'),
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

class BatchRow extends StatelessWidget {
  final Data data;
  final double spacingInDp;

  const BatchRow({Key? key, required this.data, required this.spacingInDp})
      : super(key: key);

  Color getStatusCodeColor() {
    if (data.batchStatus == 1) {
      return Colors.green;
    } else if (data.batchStatus == 2) {
      return Colors.red;
    } else {
      return Colors.yellowAccent;
    }
  }



  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusCodeColor();

    return Material(
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BatchDetailsScreen(
                  batchData: data,
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(
              spacingInDp * MediaQuery.of(context).textScaleFactor,
              spacingInDp * MediaQuery.of(context).textScaleFactor,
              spacingInDp * MediaQuery.of(context).textScaleFactor,
              spacingInDp * MediaQuery.of(context).textScaleFactor,
            ),
            alignment: const Alignment(3, 4,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(data.batchTitle ?? '',
                        style: TextStyleConstants.titleStyle),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: statusColor,
                      radius: 9,
                    ),
                  ],
                ),
                SizedBox(
                    height: spacingInDp *
                        MediaQuery.of(context)
                            .textScaleFactor), // Convert to actual pixels
                Text(
                  'Batch Start Date: ${data.batchStartDate}',
                  style: TextStyleConstants.regularStyle,
                ),
                Text('Classroom Title: ${data.classroomTitle}',
                    style: TextStyleConstants.regularStyle),
                Text('Pending Fees: ${data.pendingFees}',
                    style: TextStyleConstants.regularStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*card UI*/

class BatchDetailsScreen extends StatelessWidget {
  final Data batchData;

  const BatchDetailsScreen({Key? key, required this.batchData})
      : super(key: key);

  String getPaymentStatusText() {
    if (batchData.paymentStatus == true) {
      return 'Paid';
    } else {
      return 'Not Paid';
    }
  }

  String getStatus() {
    final status = batchData.batchStatus;
    switch (status) {
      case 1:
        return 'Started';
      case 2:
        return 'Not Started';
      default:
        return 'Unknown status';
    }
  }

  String getEnrollmentStatus() {
    final status = batchData.enrollmentStatus;
    switch (status) {
      case 1:
        return 'Enrolled';
      case 2:
        return 'Not Enrolled';
      default:
        return 'Unknown status';
    }
  }
  String? getAttendanceStatus() {
    final status = batchData.attendanceInPercentage;
    if (status!= null) {
      return 'Attendance: $status';
    } else {
      return 'No attendance found';
    }
  }

  Widget buildCardWithTitle(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            title,
            style: TextStyleConstants.titleStyle,
          ),
        ),
        SizedBox(
          width: double.infinity, // Set width to full width
          child: Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: content,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyleConstants.regularStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyleConstants.regularStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Batch Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCardWithTitle(
              'Batch Details:',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow(
                    'Batch Title:',
                    batchData.batchTitle ?? "N/A",
                  ),
                  buildInfoRow(
                    'Batch Start Date:',
                    batchData.batchStartDate ?? "N/A",
                  ),
                  buildInfoRow(
                    'Batch End Date:',
                    batchData.batchEndDate ?? "N/A",
                  ),
                  buildInfoRow(
                    'Batch Status:',
                    getStatus(),
                  ),
                  buildInfoRow(
                    'Course Name:',
                    batchData.courseTitle ?? "N/A",
                  ),
                  buildInfoRow(
                    'Classroom Name:',
                    batchData.classroomTitle ?? "N/A",
                  ),
                  buildInfoRow(
                    'Attendance:',
                    getAttendanceStatus() ?? '',
                  ),
                  const Divider(),
                  TextButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>  const AttendanceUI(),
                        ),
                    );
                  }, child: const Text("View Attendance"))
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            buildCardWithTitle(
              'Enrollment Details:',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow(
                    'Enrollment Status:',
                    getEnrollmentStatus(),
                  ),
                  buildInfoRow(
                    'Enrollment Date:',
                    batchData.enrollmentDate ?? "N/A",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            buildCardWithTitle(
              'Fees Details:',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow(
                    'fees', '${batchData.fees ?? ''}',
                  ),
                  buildInfoRow(
                    'Discount:',
                    '${batchData.discount ?? "N/A"}',
                  ),
                  buildInfoRow(
                    'Payment Status:',
                    getPaymentStatusText(),
                  ),
                  buildInfoRow(
                    'Pending Fees:',
                    '${batchData.pendingFees ?? ''}',
                  ),
                  // const Divider(),
                  // TextButton(onPressed: (){
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const (),
                  //     ),
                  //   );
//                  }, child: const Text("View Fees"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}