import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/material.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Util/show_toast.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../Details/UI/detail_screen.dart';
import '../Model/message_list_model.dart';
import '../BLoc/message_list_bloc.dart';

class StudentMessageServiceUI extends StatefulWidget {










  final int messageid;
  const StudentMessageServiceUI({Key? key, required this.messageid}) : super(key: key);

  @override
  _StudentMessageServiceUIState createState() =>
      _StudentMessageServiceUIState();
}

class _StudentMessageServiceUIState extends State<StudentMessageServiceUI> {
  List<Data> messageList = [];
  final MessagesListBLoc _bloc = MessagesListBLoc();

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Student Messages'),
      ), //messageDetailsStream
      body: StreamBuilder<List<Data>>(
        stream: _bloc.studentMessageStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            messageList = snapshot.data!.cast<Data>();
            //messageList = snapshot.data!;
            return ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                final message = messageList[index];
                final plainText = parseHtmlString(message.messageText ?? '');
                return InkWell(
                  onTap: () {
                    showToast('clicked');
                    showToast('clicked');
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => MessageDetailsScreen(messageid: message.messageId,)),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        surfaceTintColor: Colors.blueGrey,
                        borderOnForeground: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.messageTitle ?? '',
                              style: TextStyleConstants.regularStyle,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${message.addedByName}'),
                                Text('${message.sentOn}')
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('${message.batchTitle}'),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
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
      ),
    );
  }
}
