/*import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/material.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Util/show_toast.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../Model/message_details_model.dart';
import '../BLoc/message_details_bloc.dart';


class MessageDetailsScreen extends StatefulWidget {
  const MessageDetailsScreen({Key? key}) : super(key: key);

  @override
  _MessageDetailsScreenState createState() => _MessageDetailsScreenState();
}

class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
  List<Data> messageList = [];
  List<Data> Attachment = [];
  final MessageDetailList _bloc = MessageDetailList();

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
    final document = htmlParser.parse(htmlString);
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
            },
          ),
          title: const Text('Student Messages'),
        ), //messageDetailsStream
        body: StreamBuilder<MessagesDetailsModel>(
          stream: _bloc.studentMessageStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Access the list of messages from the MessagesDetailsModel
              final messagesModel = snapshot.data!;

              return ListView.builder(
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  final message = messageList[index];
                  final plainText = parseHtmlString(message.messageText ?? '');

                  final attachments= message.attachments;
                  return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.messageTitle ?? '',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text('${message.messageId}'),
                                  Text('${message.sentOn}')
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('${message.sentByName}'),
                              const SizedBox(height: 8),
                            ],
                          ),
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
        )
    );
  }
}*/
/*
      // body: StreamBuilder<MessagesDetailsModel>(
      //   stream: _bloc.studentMessageStream,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       messageList = snapshot.data! as List<Data>;
      //       //messageList = snapshot.data!;
      //       return ListView.builder(
      //         itemCount: messageList.length,
      //         itemBuilder: (context, index) {
      //           final message = messageList[index];
      //           final plainText = parseHtmlString(message.messageText?? '');
      //           return InkWell(
      //             onTap: (){
      //               showToast('clicked');
      //               // Navigator.of(context).push(
      //               // MaterialPageRoute(builder: (_) => const BatchDetailsUI()),
      //               // );
      //             },
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.stretch,
      //               children: [
      //                 Card(
      //                   margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      //                   surfaceTintColor: Colors.blueGrey,
      //                   borderOnForeground: true,
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         message.messageTitle?? '',
      //                         style: TextStyleConstants.regularStyle,
      //                       ),
      //                       SizedBox(height: 20,),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Text('${message.messageId}'),
      //                           Text('${message.sentOn}')
      //                         ],
      //                       ),
      //                       const SizedBox(height: 8),
      //                       Text('${message.sentByName}'),
      //                       const SizedBox(height: 8),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error fetching data: ${snapshot.error}'),
      //       );
      //     } else {
      //       return const Center(
      //         child: LoadingDialog(),
      //       );
*/

//TODO:😂😂😂😂😂😂😂😂😂😂😂😂😂😂




import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/material.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Util/show_toast.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../Model/message_details_model.dart';
import '../BLoc/message_details_bloc.dart';

class MessageDetailsScreen extends StatefulWidget {




  final int messageid;

  const MessageDetailsScreen({Key? key, required this.messageid}) : super(key: key);

  @override
  _MessageDetailsScreenState createState() => _MessageDetailsScreenState();
}

class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
  final MessageDetailList _bloc = MessageDetailList();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.messageid);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  String parseHtmlString(String htmlString) {
    final document = htmlParser.parse(htmlString);
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
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('News Details'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.studentMessageStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final newsDetailsList = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: newsDetailsList.map((data) {
                  final plainText = parseHtmlString(data.messageTitle ?? '');
                  final plainText1 = parseHtmlString(data.sentOn ?? '');

                  // Access attachments here
                  final attachments = data.attachments;

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 9),
                          Center(
                            child: Text(
                              plainText,
                              style: TextStyleConstants.titleStyle,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Divider(thickness: 0.8,endIndent: 0.8,indent: 0.8,height: 15),
                          const SizedBox(height: 20),
                          Text(
                            plainText1,
                            style: TextStyleConstants.regularStyle,
                          ),
                          const SizedBox(height: 20),
                          Divider(endIndent: 9,indent: 9,thickness: 0.5,),

                          SizedBox(height: 20,),
                          for (var attachment in attachments!)
                            Image.network('${attachment.attachmentUrl}',height: 100,width: 100),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                '${data.sentByName}',
                                style: TextStyleConstants.regularStyle,
                              ),


                              Text(
                                '${data.sentOn}',
                                style: TextStyleConstants.regularStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
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
