//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:html/parser.dart' as htmlParser;
// import 'package:html/dom.dart' as dom;
// import '../../../../../Commons/back_button.dart';
// import '../../../../../Commons/drawer_state_provider.dart';
// import '../../../../Commons/text_style__constants.dart';
// import '../../../../Util/show_toast.dart';
// import '../../../Commons/loading_dialog.dart';
// import '../Model/news_list_model.dart';
// import '../Bloc/get_news_details.dart';
//
// class NewsDetailsPage extends StatefulWidget {
//
//   final int newsCode;
//
//   const NewsDetailsPage({Key? key,  required this.newsCode}) : super(key: key);
//
//   @override
//   _NewsDetailsPageState createState() => _NewsDetailsPageState();
// }
//
// class _NewsDetailsPageState extends State<NewsDetailsPage> {
//   final GetNewsDetails _bloc = GetNewsDetails();
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc.fetchDataFromApi(widget.newsCode);
//   }
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   String parseHtmlString(String htmlString) {
//     final document = htmlParser.parse(htmlString);
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
//     final isDrawerOpen = Provider.of<DrawerStateProvider>(context).isDrawerOpen;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios,color: Colors.grey,),
//           onPressed: () {
//             Navigator.pop(context);
//             //navigateToMainScreen(context); // You might need to define this function
//           },
//         ),
//         title: const Text('News Details'),
//       ),
//       extendBodyBehindAppBar: true,
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.getNewsStream,
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
//                   final plainText = parseHtmlString(data.newsTitle ?? '');
//                   final plainText1 = parseHtmlString(data.newsText ?? '');
//                   // /*return Padding(
//                   //   padding: const EdgeInsets.all(5.0),
//                   //   child: Container(
//                   //     padding: const EdgeInsets.all(5.0),
//                   //     decoration: BoxDecoration(
//                   //       border: Border.all(
//                   //         color: Colors.grey,
//                   //         width: 1.0,
//                   //       ),
//                   //       borderRadius: BorderRadius.circular(5.0),
//                   //     ),
//                   //     child: Column(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       children: [
//                   //         const SizedBox(height: 9),
//                   //         Text(
//                   //           plainText,
//                   //           style: TextStyleConstants.regularStyle,
//                   //         ),
//                   //         const SizedBox(height: 9),
//                   //         Text(
//                   //           plainText1,
//                   //           style: TextStyleConstants.regularStyle,
//                   //         ),
//                   //         const SizedBox(height: 9),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // );*/
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
// import 'package:flutter/material.dart';
// import 'package:html/parser.dart' as htmlParser;//
// import 'package:html/dom.dart' as dom;
// import '../../../../Commons/text_style__constants.dart';
// import '../../../Commons/loading_dialog.dart';
// import '../Model/news_list_model.dart';
// import '../Bloc/get_news_details.dart';
//
// class NewsDetailsPage extends StatefulWidget {
//   final int newsCode;
//
//   const NewsDetailsPage({Key? key, required this.newsCode}) : super(key: key);
//
//   @override
//   _NewsDetailsPageState createState() => _NewsDetailsPageState();
// }
//
// class _NewsDetailsPageState extends State<NewsDetailsPage> {
//   final GetNewsDetails _bloc = GetNewsDetails();
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc.fetchDataFromApi(widget.newsCode);
//   }
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   String parseHtmlString(String htmlString) {
//     final document = htmlParser.parse(htmlString);
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
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('News Details'),
//       ),
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.getNewsStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final newsDetailsList = snapshot.data!;
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: newsDetailsList.map((data) {
//                   final plainText = parseHtmlString(data.newsTitle ?? '');
//                   final plainText1 = parseHtmlString(data.newsText ?? '');
//
//                   // Access attachments here
//                   final attachments = data.attachments;
//
//                   return Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Container(
//                       padding: const EdgeInsets.all(5.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 9),
//                           Center(
//                             child: Text(
//                               plainText,
//                               style: TextStyleConstants.titleStyle,
//                             ),
//                           ),
// SizedBox(height: 20,),
// // Divider(thickness: 0.8,endIndent: 0.8,indent: 0.8,height: 15),
//                           const SizedBox(height: 20),
//                         Text(
//                             plainText1,
//                             style: TextStyleConstants.regularStyle,
//                           ),
//                           const SizedBox(height: 20),
//                           // Divider(endIndent: 9,indent: 9,thickness: 0.5,),
//
//                             SizedBox(height: 20,),
//                           for (var attachment in attachments!)
//                             Image.network('${attachment.imageUrl}',height: 350),
//                           const SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//                               Text(
//                                 '${data.author}',
//                                 style: TextStyleConstants.regularStyle,
//                               ),
//
//
//                               Text(
//                                 '${data.publishedOn}',
//                                 style: TextStyleConstants.regularStyle,
//                               ),
//                             ],
//                           ),
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
// }
// */
//TODO::[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]][][][][
/*
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;//
import 'package:html/dom.dart' as dom;
import '../../../../Commons/text_style__constants.dart';
import '../../../Commons/loading_dialog.dart';
import '../Model/news_list_model.dart';
import '../Bloc/get_news_details.dart';

class NewsDetailsPage extends StatefulWidget {
  final int newsCode;

  const NewsDetailsPage({Key? key, required this.newsCode}) : super(key: key);

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  final GetNewsDetails _bloc = GetNewsDetails();

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
      extendBodyBehindAppBar: true,
      body: StreamBuilder<List<Data>>(
        stream: _bloc.getNewsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final newsDetailsList = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: newsDetailsList.map((data) {
                  final plainText = parseHtmlString(data.newsTitle ?? '');
                  final plainText1 = parseHtmlString(data.newsText ?? '');

                  // Access attachments here
                  final attachments = data.attachments;

                  */
/*return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
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
// Divider(thickness: 0.8,endIndent: 0.8,indent: 0.8,height: 15),
                          const SizedBox(height: 20),
                          Text(
                            plainText1,
                            style: TextStyleConstants.regularStyle,
                          ),
                          const SizedBox(height: 20),
                          // Divider(endIndent: 9,indent: 9,thickness: 0.5,),

                          SizedBox(height: 20,),
                          for (var attachment in attachments!)
                            Image.network('${attachment.imageUrl}',height: 350),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                '${data.author}',
                                style: TextStyleConstants.regularStyle,
                              ),


                              Text(
                                '${data.publishedOn}',
                                style: TextStyleConstants.regularStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );*//*

                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: NetworkImage('https://images.unsplash.com/photo-165656534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'),
                            fit: BoxFit.cover,
                          )

                        ),
                      )
                    ],
                  );
                }).toList(),
            )
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
*/

///Ad
///
///
///
 /*
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../../Commons/text_style__constants.dart';
import '../../../Commons/loading_dialog.dart';
import '../Model/news_list_model.dart';
import '../Bloc/get_news_details.dart';

class NewsDetailsPage extends StatefulWidget {
  final int newsCode;

  const NewsDetailsPage({Key? key, required this.newsCode}) : super(key: key);

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  final GetNewsDetails _bloc = GetNewsDetails();

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
      extendBodyBehindAppBar: true,
      body: StreamBuilder<List<Data>>(
        stream: _bloc.getNewsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final newsDetailsList = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: newsDetailsList.map((data) {
                  final plainText = parseHtmlString(data.newsTitle ?? '');
                  final plainText1 = parseHtmlString(data.newsText ?? '');

                  // Access attachments here
                  final attachments = data.attachments;

                  return Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-165656534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'),
                        fit: BoxFit.cover,
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
}*/
///
/// ///
/// ////
/// ///
///
///
///
///
///
// import 'package:flutter/material.dart';
// import 'package:html/parser.dart' as htmlParser;
// import 'package:html/dom.dart' as dom;
// import '../../../../Commons/text_style__constants.dart';
// import '../../../Commons/loading_dialog.dart';
// import '../Model/news_list_model.dart';
// import '../Bloc/get_news_details.dart';
//
// class NewsDetailsPage extends StatefulWidget {
//   final int newsCode;
//
//   const NewsDetailsPage({Key? key, required this.newsCode}) : super(key: key);
//
//   @override
//   _NewsDetailsPageState createState() => _NewsDetailsPageState();
// }
//
// class _NewsDetailsPageState extends State<NewsDetailsPage> {
//   final GetNewsDetails _bloc = GetNewsDetails();
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc.fetchDataFromApi(widget.newsCode);
//   }
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   String parseHtmlString(String htmlString) {
//     final document = htmlParser.parse(htmlString);
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
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('News Details'),
//       ),
//       extendBodyBehindAppBar: true, // This extends the background image behind the app bar
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.getNewsStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final newsDetailsList = snapshot.data!;
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: newsDetailsList.map((data) {
//                   final plainText = parseHtmlString(data.newsTitle ?? '');
//                   final plainText1 = parseHtmlString(data.newsText ?? '');
//
//                   // Access attachments here
//                   final attachments = data.attachments;
//
//                   return Container(
//                     height: MediaQuery.of(context).size.height * 0.45,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image:  DecorationImage(
//                         image: NetworkImage('https://images.unsplash.com/photo-165656534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         Text('News Of the day '),
//                       ],
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
// }

//1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣
// /*
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:html/parser.dart' as htmlParser;
// import 'package:html/dom.dart' as dom;
// import '../../../../Commons/text_style__constants.dart';
// import '../../../Commons/loading_dialog.dart';
// import '../Model/news_list_model.dart';
// import '../Bloc/get_news_details.dart';
//
// class NewsDetailsPage extends StatefulWidget {
//   final int newsCode;
//
//   const NewsDetailsPage({Key? key, required this.newsCode}) : super(key: key);
//
//   @override
//   _NewsDetailsPageState createState() => _NewsDetailsPageState();
// }
//
// class _NewsDetailsPageState extends State<NewsDetailsPage> {
//   final GetNewsDetails _bloc = GetNewsDetails();
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc.fetchDataFromApi(widget.newsCode);
//   }
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   String parseHtmlString(String htmlString) {
//     final document = htmlParser.parse(htmlString);
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
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('News Details'),
//       ),
//       extendBodyBehindAppBar: true,
//       body: StreamBuilder<List<Data>>(
//         stream: _bloc.getNewsStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final newsDetailsList = snapshot.data!;
//             return ListView.builder(
//               itemCount: newsDetailsList.length,
//               itemBuilder: (context, index) {
//                 final data = newsDetailsList[index];
//                 final plainText = parseHtmlString(data.newsTitle ?? '');
//                 final plainText1 = parseHtmlString(data.newsText ?? '');
//
//                 // Access attachments here
//                 final attachments = data.attachments;
//
//                 return Container(
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height * 0.45,
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     color: CupertinoColors.systemGroupedBackground,
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       // image: NetworkImage('${attachments?[index].imageUrl}'),
//                       image: NetworkImage(
//                           'https://images.unsplash.com/photo-1656106534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomTag(backgroundColor: Colors.grey.withAlpha(150),
//                         children: [
//                           Text('New Of the Day', style: Theme
//                               .of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(color: Colors.white),),
//                           // const SizedBox(height: 20),
//                           // Text(plainText1, style: TextStyleConstants.regularStyle),
//                           // const SizedBox(height: 20),
//                           // You can access other properties of 'data' here and customize the UI as needed.
//                           ],
//                       ),
//                       SizedBox(height: 5,),
//                       Text(plainText, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,fontWeight: FontWeight.w500,height: 1.25),),
//                     ],
//                   ),
//                 );
//                 },
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
//
//   class CustomTag extends StatelessWidget{
//   const CustomTag({super.key, required this.backgroundColor, required this.children});
//
//   final Color backgroundColor;
//   final List<Widget> children;
//
//
//   @override
//   Widget build(BuildContext context) {
//   // TODO: implement build
//   return Container(
//   padding: EdgeInsets.all(5.0),
//   decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(20.0),
//   ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//       children: children,
//   ),
//   );
//   }}
//
//
// class BreakingNew extends StatelessWidget{
//   const BreakingNew({super.key,});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//
// child: Column(
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text('data',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),)
//       ],
//     )
//   ],
// ),
//     );
//   }}
// */
//1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣
/*


class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {


  return Container(
  height: MediaQuery.of(context).size.height * 0.45,
  width: double.infinity,
  padding: const EdgeInsets.all(20.0),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  image: DecorationImage(
  image: NetworkImage('${attachments?[index].imageUrl}'),
  // 'https://images.unsplash.com/photo-165656534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80
  fit: BoxFit.cover,
  ),
  ),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('New Of the Day',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.blueGrey),),
  // const SizedBox(height: 20),
  // Text(plainText1, style: TextStyleConstants.regularStyle),
  // const SizedBox(height: 20),
  // You can access other properties of 'data' here and customize the UI as needed.
  ],
  ),
  );
}
*/


















//TODO: 1 UI
/*
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../../Commons/text_style__constants.dart';
import '../../../Commons/loading_dialog.dart';
import '../Model/news_list_model.dart';
import '../Bloc/get_news_details.dart';

class NewsDetailsPage extends StatefulWidget {
  final int newsCode;

  const NewsDetailsPage({Key? key, required this.newsCode}) : super(key: key);

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  final GetNewsDetails _bloc = GetNewsDetails();

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
// backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
        stream: _bloc.getNewsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final newsDetailsList = snapshot.data!;
            return ListView.builder(
              itemCount: newsDetailsList.length,
              itemBuilder: (context, index) {
                final data = newsDetailsList[index];
                final plainText = parseHtmlString(data.newsTitle?? '');
                final plainText1 = parseHtmlString(data.newsText?? '');

                // Access attachments here
                final attachments = data.attachments;

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5),
                        ),
                        child: Image.network(
                          '${attachments?[index].imageUrl}',
                          // height: 200,
                          // width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Of the Day',
                              style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              plainText,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              plainText1,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
                            ),
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
            return Center(
              child: LoadingDialog(),
            );
          }
        },
      ),
    );
  }
}
*/







import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import '../../../../Commons/text_style__constants.dart';
import '../../../Commons/loading_dialog.dart';
import '../Model/news_list_model.dart';
import '../Bloc/get_news_details.dart';

class NewsDetailsPage extends StatefulWidget {
  final int newsCode;

  const NewsDetailsPage({Key? key, required this.newsCode}) : super(key: key);

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  final GetNewsDetails _bloc = GetNewsDetails();

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
        stream: _bloc.getNewsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final newsDetailsList = snapshot.data!;
            return ListView.builder(
              itemCount: newsDetailsList.length,
              itemBuilder: (context, index) {
                final data = newsDetailsList[index];
                final plainText = parseHtmlString(data.newsTitle ?? '');
                final plainText1 = parseHtmlString(data.newsText ?? '');

                // Access attachments here
                final attachments = data.attachments;

                return Column(
                  children: [
                    // Image and content inside the image
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.45,
                      width: double.infinity,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGroupedBackground,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage('${attachments?[index].imageUrl}',scale: 0.50),
                          // image: NetworkImage(
                          //     'https://images.unsplash.com/photo-1656106534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'
                          // ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTag(
                            backgroundColor: Colors.grey.withAlpha(150),
                            children: [
                              // Text(
                              //   'New Of the Day',
                              //   style: Theme
                              //       .of(context)
                              //       .textTheme
                              //       .bodyMedium!
                              //       .copyWith(color: Colors.white),
                              // ),
                            ],
                          ),
                          SizedBox(height: 5),
                          // Text(plainText, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,fontWeight: FontWeight.w500,height: 1.25),),
                        ],
                      ),
                    ),
                    // Breaking news section
                    BreakingNew(data: data),
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
  const CustomTag({Key? key, required this.backgroundColor, required this.children, });

final Color backgroundColor;
final List<Widget> children;

@override
Widget build(BuildContext context) {


  return Container(
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    ),
  );
}
}
class BreakingNew extends StatelessWidget {
  final Data data;

  BreakingNew({Key? key, required this.data});


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
    final plainText = parseHtmlString(data.newsTitle ?? '');
    final plainText1 = parseHtmlString(data.newsText ?? '');

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.grey,
        //     width: 1.0,
        //   ),
        // ),
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
            const SizedBox(height: 20),
            Text(
              plainText1,
              style: TextStyleConstants.regularStyle,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${data.author}',
                  style: TextStyleConstants.regularStyle,
                ),
                Text(
                  '${data.publishedOn}',
                  style: TextStyleConstants.regularStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
