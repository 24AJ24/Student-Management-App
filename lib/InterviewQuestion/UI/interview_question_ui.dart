// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:html/parser.dart' as htmlParser;
// import 'package:html/dom.dart' as dom;
// import 'package:provider/provider.dart';
// import '../../Commons/back_button.dart';
// import '../../Commons/drawer_state_provider.dart';
// import '../../Commons/text_style__constants.dart';
// import '../../Util/show_toast.dart';
// import '../Bloc/interview_question_bloc.dart';
// import '../Model/interview_model.dart';
//
// class InterviewScreen extends StatefulWidget {
//   const InterviewScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _InterviewScreenState createState() => _InterviewScreenState();
// }
//
// class _InterviewScreenState extends State<InterviewScreen> {
//   final InterviewQuestionBloc _bloc = InterviewQuestionBloc();
//   List<bool> cardExpandedStates = []; // List to track card states
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
//   String parseHtmlString(String htmlString) {
//     final dom.Document document = htmlParser.parse(htmlString);
//     return parseElement(document.body!);
//   }
//
//   String parseElement(dom.Node node) {
//     if (node is dom.Text) {
//       return node.text;
//     } else if (node is dom.Element) {
//       return node.nodes.map((e) => parseElement(e)).join();
//     }
//     return '';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isDrawerOpen = Provider.of<DrawerStateProvider>(context).isDrawerOpen;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//             navigateToMainScreen(
//                 context); // You might need to define this function
//           },
//         ),
//         title: const Text('News'),
//       ),
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.interviewQuestionStream,
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
//             List<Data> articlesDetailsList = snapshot.data!;
//             return ListView.builder(
//               itemCount: articlesDetailsList.length,
//               itemBuilder: (context, index) {
//                 Data data = articlesDetailsList[index];
//                 String plainText = parseHtmlString(data.questionTitle ?? '');
//                 String plainText1 = parseHtmlString(data.questionText ?? '');
//
//                 if (cardExpandedStates.length <= index) {
//                   cardExpandedStates.add(true);
//                 }
//                 return ExpansionTile(
//                   initiallyExpanded: true,
//                   title: Text(
//                     '${data.subjectTitle}',
//                     style: TextStyleConstants.titleStyle,
//                   ),
//                   subtitle: Text(
//                     '${data.addedByName}',
//                     style: TextStyleConstants.regularStyle,
//                   ),
//                   children: [
//                     Text(
//                       'Question Title: ${data.questionTitle}',
//                       style: TextStyleConstants.regularStyle,
//                     ),
//                     Text(
//                       'Question Text: ${data.questionText}',
//                       style: TextStyleConstants.regularStyle,
//                     ),
//                     Text(
//                       'Tags: ${data.tags}',
//                       style: TextStyleConstants.regularStyle,
//                     ),
//                   ],
//                 );
//               },
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

/*
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Commons/text_style__constants.dart';
import '../Model/interview_model.dart';
import '../Bloc/interview_question_bloc.dart';

import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;

class PlacementScreen extends StatefulWidget {


  const PlacementScreen({Key? key,}) : super(key: key);

  @override
  _PlacementScreenState createState() => _PlacementScreenState();
}

class _PlacementScreenState extends State<PlacementScreen> {
  final InterviewQuestionBloc _bloc = InterviewQuestionBloc();

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
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('News Details'),
      ),
      extendBodyBehindAppBar: true,
      body: StreamBuilder<List<Data>>(
        stream: _bloc.interviewQuestionStream,
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
                String plainText = parseHtmlString(data.questionTitle ?? '');
                String plainText1 = parseHtmlString(data.questionText ?? '');
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // Image and content inside the image
                    Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: double.infinity,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGroupedBackground,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1656106534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTag(
                            backgroundColor: Colors.transparent,
                            // backgroundColor: Colors.grey.withAlpha(150),

                            children: [

                              Text(
                                'Number of Position:  ${primaryInfo.noOfPositions}',
                                style: TextStyleConstants.titleStyle,),
                              // Text('${primaryInfo.remark}')
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    // Breaking news section
                    BreakingNew(rounds: details,primaryInfo: primaryInfo),
                  ],
                );
              },
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
    );
  }
}

class CustomTag extends StatelessWidget {
  const CustomTag({
    Key? key,
    required this.backgroundColor,
    required this.children,
  });

  final Color backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

class BreakingNew extends StatelessWidget {
  final Rounds rounds;
  final PrimaryInfo primaryInfo;
  const BreakingNew(
      {super.key, required this.rounds, required this.primaryInfo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              '${primaryInfo.recruitmentTitle}',
              style: TextStyleConstants.titleStyle,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _launchMap('${primaryInfo.companyAddress}');
              },

              child: Text(
                '${primaryInfo.companyAddress}',
                softWrap: true,
                style: TextStyleConstants.regularStyle,
                // style: TextStyleConstants.regularStyle.copyWith(
                //   color: Colors.blue, // Change text color to indicate it's clickable
                //   decoration: TextDecoration.underline, // Add underline
                // ),
              ),
            ),

            const SizedBox(height: 15),
            // Text(
            //   '${primaryInfo.companyAddress}', softWrap: true,
            //   style: TextStyleConstants.regularStyle,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [

                // First side: Contact Numbers
                Column(
                  children: [
                    Text('${primaryInfo.companyContactNo1}'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('${primaryInfo.companyEmail1}'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => launchUrl(
                  Uri.parse(
                      '${primaryInfo.companyWebsite}')
              ),
              child: Text(
                primaryInfo.companyWebsite ?? '',softWrap: true,
                style: TextStyleConstants.weblink,
              ),
            ),
            const SizedBox( height: 19),
            ExpansionTileCard(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  '${primaryInfo.imageUrl}',scale: 0.15,
                ),
              ),
              title: const Text("Round Description"),
              // subtitle: const Text("Round Description"),
              children: [
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${rounds.roundTitle}',
                            style: TextStyleConstants.titleText
                        ),
                        const SizedBox(height: 19),
                        Text(
                            '${rounds.roundDescription}',
                            style: TextStyleConstants.regularStyle
                        ),
                        const SizedBox(height: 19),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${rounds.roundDateTime}',
                              style: TextStyleConstants.regularStyle,softWrap: true,
                            ),
                            Text(
                                rounds.isAttain == null?'Not Attended':rounds.isAttain !=null ? 'Attended' : 'Pending',style: TextStyleConstants.regularStyle,softWrap: true,maxLines: AndroidPointerProperties.kToolTypeEraser),
                          ],
                        ),
                        const SizedBox(height: 19),
                        Text(
                          '${rounds.roundVenue}',
                          style: TextStyleConstants.regularStyle,
                        ),
                        // Row(
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text('Round Venue', style: TextStyleConstants.regularStyle),
                        //         Text(
                        //           '${rounds.roundVenue}',
                        //           style: TextStyleConstants.regularStyle,
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        // Row(
                        //
                        //   children: [
                        //   Text ('Round Venue '),
                        //  Text(
                        //   '${rounds.roundVenue}',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text('${rounds.addedDateTime}', style: TextStyleConstants.regularStyle,),
          ],
        ),
      ),
    );
  }
}
*/







///
///
///


/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';
import '../../Commons/back_button.dart';
import '../../Commons/drawer_state_provider.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/interview_question_bloc.dart';
import '../Model/interview_model.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  _InterviewScreenState createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {
  final InterviewQuestionBloc _bloc = InterviewQuestionBloc();
  List<bool> cardExpandedStates = []; // List to track card states

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(
                context); // You might need to define this function
          },
        ),
        title: const Text('News'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.interviewQuestionStream,
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
                String plainText = parseHtmlString(data.questionTitle ?? '');
                String plainText1 = parseHtmlString(data.questionText ?? '');

                if (cardExpandedStates.length <= index) {
                  cardExpandedStates.add(false);
                }
                return ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    '${data.subjectTitle}',
                    style: TextStyleConstants.titleStyle,
                  ),
                  subtitle: Text(
                    '${data.addedByName}',
                    style: TextStyleConstants.regularStyle,
                  ),

                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            plainText,
                            style: TextStyleConstants.regularStyle,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Question Text: ${data.questionText}',
                            style: TextStyleConstants.regularStyle,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Tags: ${data.tags}',
                            style: TextStyleConstants.regularStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
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
*/
///
///
///
///
///
/*import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';
import '../../Commons/back_button.dart';
import '../../Commons/drawer_state_provider.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/interview_question_bloc.dart';
import '../Model/interview_model.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  _InterviewScreenState createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  final InterviewQuestionBloc _bloc = InterviewQuestionBloc();
  List<bool> cardExpandedStates = []; // List to track card states

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(
                context); // You might need to define this function
          },
        ),
        title: const Text('News'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.interviewQuestionStream,
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
                String plainText = parseHtmlString(data.questionTitle ?? '');
                String plainText1 = parseHtmlString(data.questionText ?? '');

                if (cardExpandedStates.length <= index) {
                  cardExpandedStates.add(true);
                }
                 ExpansionTileCard(
                  baseColor: Colors.cyan[50],
                  expandedColor: Colors.red[50],
                  key: cardA,
                  leading: CircleAvatar(
                      child: Image.asset("image/admin.jpg")),

                  title: Text("Flutter Dev's"),
                  subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                  children: <Widget>[
                  Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
                ),
                child: Text(
                "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
                " creative and leading-edge flutter app development solutions for customers all around the globe.",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 16),
                ),
                ),
                ),
                // ButtonBar(
                // alignment: MainAxisAlignment.spaceAround,
                // buttonHeight: 52.0,
                // buttonMinWidth: 90.0,
                // children: <Widget>[
                // FlatButton(
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(4.0)),
                // onPressed: () {
                // cardA.currentState?.expand();
                // },
                // child: Column(
                // children: <Widget>[
                // Icon(Icons.arrow_downward),
                // Padding(
                // padding: const EdgeInsets.symmetric(vertical: 2.0),
                // ),
                // Text('Open'),
                // ],
                // ),
                // ),
                // FlatButton(
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(4.0)),
                // onPressed: () {
                // cardA.currentState?.collapse();
                // },
                // child: Column(
                // children: <Widget>[
                // Icon(Icons.arrow_upward),
                // Padding(
                // padding: const EdgeInsets.symmetric(vertical: 2.0),
                // ),
                // Text('Close'),
                // ],
                // ),
                // ),
                // FlatButton(
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(4.0)),
                // onPressed: () {
                // },
                // child: Column(
                // children: <Widget>[
                // Icon(Icons.swap_vert),
                // Padding(
                // padding: const EdgeInsets.symmetric(vertical: 2.0),
                // ),
                // Text('Toggle'),
                // ],
                // ),
                // ),
                //
                //   ],
                // ),
                ],
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
}*/

/*
 initiallyExpanded: true,
                  title: Text(
                    '${data.subjectTitle}',
                    style: TextStyleConstants.titleStyle,
                  ),
                  subtitle: Text(
                    '${data.addedByName}',
                    style: TextStyleConstants.regularStyle,
                  ),
                  children: [
                    Text(
                      'Question Title: ${data.questionTitle}',
                      style: TextStyleConstants.regularStyle,
                    ),
                    Text(
                      'Question Text: ${data.questionText}',
                      style: TextStyleConstants.regularStyle,
                    ),
                    Text(
                      'Tags: ${data.tags}',
                      style: TextStyleConstants.regularStyle,
                    ),
 */


import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';
import '../../Commons/back_button.dart';
import '../../Commons/drawer_state_provider.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/interview_question_bloc.dart';
import '../Model/interview_model.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  _InterviewScreenState createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  final InterviewQuestionBloc _bloc = InterviewQuestionBloc();
  List<bool> cardExpandedStates = []; // List to track card states

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(
                context); // You might need to define this function
          },
        ),
        title: const Text('News'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.interviewQuestionStream,
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
                String plainText = parseHtmlString(data.questionTitle?? '');
                String plainText1 = parseHtmlString(data.questionText?? '');

                if (cardExpandedStates.length <= index) {
                  cardExpandedStates.add(true);
                }
    return ExpansionTileCard(
    title: Text('${data.subjectTitle}'),
    subtitle: Text('${data.addedByName}'),
    children: [
    ListTile(
    title: Text("Amount"),
    subtitle: Text("asdasd'"),
    ),
    ListTile(
    title: Text("Date"),
    subtitle: Text("expense.date"),
    ),
    ],
    );
          }
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

// return Center(
//     child: ExpansionTileCard(
//       baseColor: Colors.cyan[50],
//       expandedColor: Colors.red[50],
//       key: cardA,
//       leading: CircleAvatar(
//         child: Image.asset("image/admin.jpg"),
//       ),
//       title: Text("Flutter Dev's"),
//       subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
//       children: <Widget>[
//       Divider(
//       thickness: 1.0,
//       height: 1.0,
//     ),
//     Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16.0,
//           vertical: 8.0,
//         ),
//         child: Text(
//             "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted, creative and leading-edge flutter app development solutions for customers all around the globe.",
//         style: Theme.of(context)
//             .textTheme
//             .bodyText2
//             ?.copyWith(fontSize: 16),
//       ),
//     ),
//   ),
// ButtonBar(
// alignment: MainAxisAlignment.spaceAround,
// buttonHeight: 52.0,
// buttonMinWidth: 90.0,
// children: <Widget>[
// FlatButton(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(4.0)),
// onPressed: () {
// cardA.currentState?.expand();
// },
// child: Column(
// children: <Widget>[
// Icon(Icons.arrow_downward),
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 2.0),
// ),
// Text('Open'),
// ],
// ),
// ),
// FlatButton(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(4.0)),
// onPressed: () {
// cardA.currentState?.collapse();
// },
// child: Column(
// children: <Widget>[
// Icon(Icons.arrow_upward),
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 2.0),
// ),
// Text('Close'),
// ],
// ),
// ),
// FlatButton(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(4.0)),
// onPressed: () {
// },
// child: Column(
// children: <Widget>[
// Icon(Icons.swap_vert),
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 2.0),
// ),
// Text('Toggle'),
// ],
// ),
// ),
//
//   ],
// ),