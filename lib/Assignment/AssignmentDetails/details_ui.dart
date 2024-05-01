
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Commons/back_button.dart';
import '../../../Commons/drawer_state_provider.dart';
import '../Bloc/assignment_detail_bloc.dart';
import '../Model/assignment_details_model.dart';

class DetailsPage extends StatefulWidget {

  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final AssignmentsDetailsBloc _bloc = AssignmentsDetailsBloc();

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
    bool isDrawerOpen = Provider.of<DrawerStateProvider>(context).isDrawerOpen;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(
                context); // You might need to define this function
          },
        ),
        title: const Text('Assignment Details '),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.assignmentsDetailsStream,
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
            List<Data> articlesDetailsList = snapshot.data!;
            return ListView.builder(
              itemCount: articlesDetailsList.length,
              itemBuilder: (context, index) {
                Data data = articlesDetailsList[index];
                String plainText = parseHtmlString('${data.assignmentTitle}');
                String plainText1 =
                parseHtmlString('${data.assignmentDescription}');

                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plainText,
                          style: TextStyleConstants.titleStyle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          plainText1,
                          style: TextStyleConstants.regularStyle,
                          overflow: TextOverflow
                              .ellipsis, // Truncate text with ellipsis
                          maxLines: 5, // Set the maximum number of lines
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${data.assignmentTags}',
                          style: TextStyleConstants.regularStyle,
                        ),

                        Text(
                          '${data.allocationTags}',
                          style: TextStyleConstants.regularStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
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
