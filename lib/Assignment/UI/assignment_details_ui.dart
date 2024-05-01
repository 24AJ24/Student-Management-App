import 'package:bitcode_student_app/Assignment/AssignmentDetails/Dialog/dialogs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:bitcode_student_app/Util/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../Commons/back_button.dart';
import '../AssignmentDetails/details_ui.dart';
import '../Model/assignment_details_model.dart';
import '../../Commons/loading_dialog.dart';
import '../../Commons/text_style__constants.dart';
import '../Bloc/assignment_detail_bloc.dart';

class AssignmentDetailsUi extends StatefulWidget {
  const AssignmentDetailsUi({Key? key}) : super(key: key);

  @override
  _AssignmentDetailsUiState createState() => _AssignmentDetailsUiState();
}

class _AssignmentDetailsUiState extends State<AssignmentDetailsUi> {
  final _bloc = AssignmentsDetailsBloc();
  List<Data> _showAssignment = [];

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  String parseHtmlString(String htmlString) {
    final dom.Document document = htmlParser.parse(htmlString);
    return parseElement(document.body!);
  }

  String parseElement(dom.Node node) {
    if (node is dom.Text) {
      return node.text;
    } else if (node is dom.Element) {
      return node.nodes.map((e) => parseElement(e)).join();
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(context);
          },
        ),
        title: const Text('Assignment'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.assignmentsDetailsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _showAssignment = snapshot.data!;
            return GroupedListView<Data, String>(
              elements: _showAssignment,
              groupBy: (data) => data.allocationTitle.toString(),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                height: 2 * MediaQuery.of(context).textScaleFactor,
              ),
              itemBuilder: (context, data) => GetAssignment(data: data),
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
class GetAssignment extends StatelessWidget {
  final Data data;

  const GetAssignment({Key? key, required this.data}) : super(key: key);

  Color getStatusCodeColor() {
    if (data.isSubmitted == 0) {
      return Colors.green;
    } else if (data.isSubmitted == 1) {
      return Colors.red;
    } else {
      return Colors.yellowAccent;
    }
  }

  @override
  Widget build(BuildContext context) {

    DateTime systemDate =DateTime.now();
    final statusColor = getStatusCodeColor();

    String dateString = '${data.activeTo}'; // Assuming data.activeTo is "2023 Jul 19, 08:00 PM"
    DateTime givenDate = DateFormat('yyyy MMM d, hh:mm a').parse(dateString);

    return Material(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: CupertinoColors.secondarySystemFill),
        ),
        child: InkWell(
          onTap: () {
            showToast('clicked');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsPage(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            alignment: const Alignment(6, 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data.allocationTitle ?? '',
                      style: TextStyleConstants.titleStyle,
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: statusColor,
                      radius: 9,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'Active: ${data.assignmentAllocatedOn}',
                  style: TextStyleConstants.regularStyle,
                ),

                Text(
                  'End: ${data.allocationActiveFrom}',
                  style: TextStyleConstants.regularStyle,
                ),
                const SizedBox(height: 15,),
                const Divider(color: CupertinoColors.inactiveGray,),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubmitAssignmentDetails(),
                      ),
                    );
                    showToast('clicked');
                  },
                  child: Text(
                    'Submitted',
                    style: TextStyleConstants.regularStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  String determineSubmissionStatus(DateTime systemDate, DateTime givenDate) {
    if (systemDate.isAfter(givenDate)) {
      return 'Not Submitted';
    } else if (systemDate.isBefore(givenDate)) {
      return 'Submitted';
    } else {
      return 'Pending';
    }
  }
}
//
//
//
//
//
//
//
