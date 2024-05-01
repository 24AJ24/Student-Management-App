import 'package:bitcode_student_app/News/NewsDetails/UI/news_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../Commons/back_button.dart';
import '../../../Commons/drawer_state_provider.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/news_bloc.dart';
import '../Model/news_model.dart';

class ArticlesDetailsPage extends StatefulWidget {
  final int newsCode;
  const ArticlesDetailsPage({Key? key, required this.newsCode})
      : super(key: key);

  @override
  _ArticlesDetailsPageState createState() => _ArticlesDetailsPageState();
}

class _ArticlesDetailsPageState extends State<ArticlesDetailsPage> {
  final LatestNewsBloc _bloc = LatestNewsBloc();
  List<bool> cardExpandedStates = []; // List to track card states

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.newsCode);
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
        stream: _bloc.latestNewsStream,
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
                String plainText = parseHtmlString(data.newsTitle ?? '');
                String plainText1 = parseHtmlString(data.newsText ?? '');

                if (cardExpandedStates.length <= index) {
                  cardExpandedStates.add(false);
                }

                return InkWell(
                  onTap: () {
                    showToast('clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(
                          newsCode: data.newsId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey.withOpacity(0.21),
                          // color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 10,
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
                          // const SizedBox(height: 16),
                          // const Divider(color: Colors.grey,indent: 20,endIndent: 20,thickness: 0.9),
                          const SizedBox(
                            height: 10,
                          ),

                          const SizedBox(height: 6),
                          Text(
                            data.newsCategoryTitle ?? '',
                            style: TextStyleConstants.regularStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.publishedOn ?? '',
                                style: TextStyleConstants.regularStyle,
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 9,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons
                                    .newspaper, // Replace this with the icon you want
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
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
/*import 'package:bitcode_student_app/News/NewsDetails/UI/news_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../Commons/back_button.dart';
import '../../../Commons/drawer_state_provider.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/news_bloc.dart';
import '../Model/news_model.dart';

class ArticlesDetailsPage extends StatefulWidget {
  final int newsCode;
  const ArticlesDetailsPage({Key? key, required this.newsCode})
      : super(key: key);

  @override
  _ArticlesDetailsPageState createState() => _ArticlesDetailsPageState();
}

class _ArticlesDetailsPageState extends State<ArticlesDetailsPage> {
  final LatestNewsBloc _bloc = LatestNewsBloc();
  List<bool> cardExpandedStates = []; // List to track card states

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.newsCode);
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
        stream: _bloc.latestNewsStream,
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
                String plainText = parseHtmlString(data.newsTitle ?? '');
                String plainText1 = parseHtmlString(data.newsText ?? '');

                if (cardExpandedStates.length <= index) {
                  cardExpandedStates.add(false);
                }

                return InkWell(
                  onTap: () {
                    showToast('clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(
                          newsCode: data.newsId,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      if (data.attachments != null)
                        for (Attachments attachment in data.attachments!)
                          Image.network(
                            '${attachment.attachmentUrl}',
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey.withOpacity(0.21),
                              // color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 10,
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
                              // const SizedBox(height: 16),
                              // const Divider(color: Colors.grey,indent: 20,endIndent: 20,thickness: 0.9),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data.publishedOn ?? '',
                                style: TextStyleConstants.regularStyle,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                data.newsCategoryTitle ?? '',
                                style: TextStyleConstants.regularStyle,
                              ),
   Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.publishedOn ?? '',
                                    style: TextStyleConstants.regularStyle,
                                  ),
                                  Text(
                                    data.newsCategoryTitle ?? '',
                                    style: TextStyleConstants.regularStyle,
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 9,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons
                                        .newspaper, // Replace this with the icon you want
                                    color: Colors.black,
                                  ),
                                ],
                              ),



                            ],
                          ),
                        ),
                      ),
                    ],
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
}*/

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../Commons/back_button.dart';
import '../../../Commons/drawer_state_provider.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/news_bloc.dart';
import '../Model/news_model.dart';
import '../NewsDetails/UI/news_details.dart';

class ArticlesDetailsPage extends StatefulWidget {
  final int newsCode;
  const ArticlesDetailsPage({Key? key, required this.newsCode})
      : super(key: key);

  @override
  _ArticlesDetailsPageState createState() => _ArticlesDetailsPageState();
}

class _ArticlesDetailsPageState extends State<ArticlesDetailsPage> {
  final LatestNewsBloc _bloc = LatestNewsBloc();
  List<bool> cardExpandedStates = []; // List to track card states

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.newsCode);
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
        stream: _bloc.latestNewsStream,
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
                String plainText = parseHtmlString(data.newsTitle ?? '');

                if (cardExpandedStates.length <= index) {
                  cardExpandedStates.add(false);
                }

                return InkWell(
                  onTap: () {
                    showToast('clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(
                          newsCode: data.newsId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey.withOpacity(0.21),
                          spreadRadius: 10,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          if (data.attachments != null)
                            for (Attachments attachment in data.attachments!)
                              Container(
                                width: 100, // Set your desired image width
                                child: Image.network(
                                  '${attachment.attachmentUrl}',
                                  fit: BoxFit.cover, // Adjust the fit as needed
                                ),
                              ),
                          const SizedBox(width: 20), // Add some spacing
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plainText,
                                  style: TextStyleConstants.titleStyle,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  data.publishedOn ?? '',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                Text(
                                  data.newsCategoryTitle ?? '',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.publishedOn ?? '',
                                      style: TextStyleConstants.regularStyle,
                                    ),
                                    Text(
                                      data.newsCategoryTitle ?? '',
                                      style: TextStyleConstants.regularStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 9),
                                Icon(
                                  Icons.newspaper, // Replace this with the icon you want
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
*/

/*
import 'package:bitcode_student_app/News/NewsDetails/UI/news_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../Commons/back_button.dart';
import '../../../Commons/drawer_state_provider.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/news_bloc.dart';
import '../Model/news_model.dart';

class ArticlesDetailsPage extends StatefulWidget {
  final int newsCode;
  const ArticlesDetailsPage({Key? key, required this.newsCode})
      : super(key: key);

  @override
  _ArticlesDetailsPageState createState() => _ArticlesDetailsPageState();
}

class _ArticlesDetailsPageState extends State<ArticlesDetailsPage> {
  final LatestNewsBloc _bloc = LatestNewsBloc();
  List<bool> cardExpandedStates = []; // List to track card states

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.newsCode);
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
        stream: _bloc.latestNewsStream,
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
                String plainText = parseHtmlString(data.newsTitle ?? '');
                String plainText1 = parseHtmlString(data.newsText ?? '');

                if (cardExpandedStates.length <= index) {
                  cardExpandedStates.add(false);
                }

                return InkWell(
                  onTap: () {
                    showToast('clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(
                          newsCode: data.newsId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey.withOpacity(0.21),
                          spreadRadius: 10,
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
                          // ...
                          // Your existing code for displaying other information
                          // ...
                          if (data.attachments != null)
                            for (Attachments attachment in data.attachments!)
                              Image.network(
                                '${attachment.attachmentUrl}',
                                fit: BoxFit.cover, // Adjust the fit as needed
                              ),
                        ],
                      ),
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
*/
