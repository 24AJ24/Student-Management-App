import 'package:flutter/material.dart';
import '../About/about_screen.dart';
import '../Commons/text_style__constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Batch/UI/batch_details_ui.dart';
import '../../Util/show_toast.dart';
import '../Assignment/UI/assignment_details_ui.dart';
import '../Auth/UI/login_form_ui.dart';
import '../Calls/PlacementsCallDetails/UI/placements_screen.dart';
import '../FeedBack/UI/feedback_ui.dart';
import '../InterviewQuestion/UI/interview_question_ui.dart';
import '../Messages/List/UI/message_list_screen.dart';
import '../News/UI/news_ui.dart';
import '../Recruiters/RecruitersList/UI/recruiters_ui_screen.dart';
import '../StudentDetails/UI/students_list_ui.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 250,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle settings button click
            },
          ),
        ],
        title: const Text(
          'Student Dashboard',
          // Style here, e.g., style: TextStyleConstants.titleText,
          textAlign: TextAlign.justify,
        ),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                'Vikas Popat Karale',
                style: TextStyleConstants.regularStyle,
              ),
              accountEmail: Text('vikaskarale0311@gmail.com',
                  style: TextStyleConstants.regularStyle),
              currentAccountPicture: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black54,
                            offset: Offset(5, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            'image/admin.jpg',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            showToast('Clicked');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                const StudentDetailInformation()));
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.multiply,
                color: Colors.white54,
                image: DecorationImage(
                  image: const AssetImage(
                    'image/logo.png',
                  ),
                  alignment: Alignment.lerp(
                      Alignment.center, Alignment.topRight, 0.80)!,
                  filterQuality: FilterQuality.high,
                  scale: 2.0,
                ),
              ),
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.assessment,
            //     size: 25,
            //   ),
            //   title: const Text('Assessments'),
            //   focusColor: Colors.black12,
            //   onTap: () {
            //     showToast("Assessment Clicked");
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.assignment_turned_in_sharp,
            //     size: 25,
            //   ),
            //   title: const Text('Assignments'),
            //   focusColor: Colors.black12,
            //   onTap: () {
            //     showToast('clicked');
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (_) => const AssignmentDetailsUi()));
            //   },
            // ),
            ListTile(
              // leading: Image.asset(
              //   'images/batch.png',
              //   scale: 2.0,
              //   height: 25,
              //   width: 25,
              // ),
              leading: const Icon(
                CupertinoIcons.ant_circle,
                // Icons.flight_class_rounded,
                size: 25,
              ),
              title: const Text('Batches'),
              focusColor: Colors.black12,
              onTap: () {
                showToast('clicked');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const BatchDetailsUI()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.news,
                size: 25,
              ),
              title: const Text('News'),
              focusColor: Colors.black12,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const ArticlesDetailsPage(
                      newsCode: 29,
                    )));
              },
            ),
            // ListTile(
            //   leading: const Icon(
            //     CupertinoIcons.money_dollar_circle,
            //     size: 25,
            //   ),
            //   title: const Text('Feedback'),
            //   focusColor: Colors.black45,
            //   onTap: () {
            //     showToast('Clicked');
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (_) => const FeedBackUi()));
            //   },
            // ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.money_dollar_circle,
                size: 25,
              ),
              title: const Text('Placement Calls'),
              focusColor: Colors.black45,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>  PlacementDetailScreen(courserId1: 1)));
                showToast('Placement call Clicked');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.message,
                size: 25,
              ),
              title: const Text('Message'),
              focusColor: Colors.black45,
              onTap: () {
                showToast('Clicked');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const StudentMessageServiceUI(
                      messageid: 0,
                    )));
              },
            ),
            // const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                Icons.lock_reset,
                size: 25,
              ),
              title: const Text('Update Password'),
              focusColor: Colors.black45,
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (_) =>  const StudentDetailInformation()));
                showToast("Update Password Clicked");
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.logout_sharp,
                  size: 25,
                ),
                title: const Text('Logout'),
                focusColor: Colors.black45,
                onTap: () async {
                  showToast('Logout');
                  SharedPreferences preferences =
                  await SharedPreferences.getInstance();
                  await preferences.clear();
                  print(preferences.clear());
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const LoginForm(),
                    ),
                  );
                }),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Carousel(), // Add the image carousel here
            // ... Other widgets for your main screen
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int _activePage = 1;
  final List<String> _images = [
    "https://www.bitcode.in/images/banner/android_training_in_pune_1920x1080.jpg",
    "https://www.bitcode.in/images/banner/bitcode-best-training-company-pune.jpg",
   ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            itemCount: _images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _activePage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildSlider(index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildIndicators(),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.80, // Set the desired height for the ListView
          child: Container(
           // color: Theme.of(context).primaryColor,
            child: SingleChildScrollView( // Wrap with SingleChildScrollView
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 50,
                  children: _buildDashboardItems(),

                    // buildDashboardItem(
                    //   'Videos',
                    //   CupertinoIcons.play_rectangle,
                    //   Colors.deepOrange,
                    // ),
                    // buildDashboardItem('Analytics', CupertinoIcons.graph_circle, Colors.green),
                    // buildDashboardItem('Audience', CupertinoIcons.person_2, Colors.purple),
                    // buildDashboardItem('Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
                    // buildDashboardItem('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo),
                    // buildDashboardItem('Upload', CupertinoIcons.add_circled, Colors.teal),
                    // buildDashboardItem('About', CupertinoIcons.question_circle, Colors.blue),
                    // buildDashboardItem('Contact', CupertinoIcons.phone, Colors.pinkAccent),

                    // Add more items here as needed

                ),
              ),
            ),

          ),

        ),
      ],
    );
  }


  List<Widget> _buildDashboardItems() {
    return [
      _buildClickableItem('Student\nProfile', CupertinoIcons.profile_circled, Colors.green, () {
        showToast('clicked');
        print('Analytics item clicked');
      }),
      _buildClickableItem('Interview\nQuestions', CupertinoIcons.question, Colors.purple, () {
        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InterviewScreen(),
                ),
              );

        showToast('clicked');
        print('Audience item clicked');
      }),

      // _buildClickableItem(
      //   'Recruiters',
      //   Container(
      //     height: 25,
      //     width: 25,
      //     child: Image.asset(
      //       'images/batch.png',
      //       scale: 2.0,
      //     ),
      //   ) as IconData,
      //   Colors.brown,
      //       () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => RecruitersScreen(),
      //       ),
      //     );
      //   },
      // ),

      _buildClickableItem('Recruiters', CupertinoIcons.chat_bubble_2, Colors.brown, () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecruitersScreen(),
          ),
        );
        print('Comments item clicked');
      }),
      _buildClickableItem('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo, () {
        print('Revenue item clicked');
      }),
      _buildClickableItem('Upload', CupertinoIcons.add_circled, Colors.teal, () {
        print('Upload item clicked');
      }),
      _buildClickableItem('About', CupertinoIcons.question_circle, Colors.blue, () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutScreen(),));

        showToast('Clicked');
        print('About item clicked');
      }),
      _buildClickableItem('Contact', CupertinoIcons.phone, Colors.pinkAccent, () {
        print('Contact item clicked');
      }),
    ];
  }

  Widget _buildClickableItem(String title, IconData iconData, Color background, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: buildDashboardItem(title, iconData, background),
    );
  }







  Widget _buildSlider(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(_activePage == index ? 10 : 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(_images[index])),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    return List.generate(_images.length, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: _activePage == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  Widget buildDashboardItem(String title, IconData iconData,
      Color background) => Container(
    decoration: BoxDecoration(
      color: Colors.white, // Set the desired background color here
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme
              .of(context)
              .primaryColor
              .withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    ),
  );
}

// sdfaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

///
///
///
///
///
///

















































/*

import 'package:flutter/material.dart';
import '../Commons/text_style__constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Batch/UI/batch_details_ui.dart';
import '../../Util/show_toast.dart';
import '../Assignment/UI/assignment_details_ui.dart';
import '../Auth/UI/login_form_ui.dart';
import '../Calls/PlacementsCallDetails/UI/placements_screen.dart';
import '../FeedBack/UI/feedback_ui.dart';
import '../Messages/List/UI/message_list_screen.dart';
import '../News/UI/news_ui.dart';
import '../Recruiters/RecruitersList/UI/recruiters_ui_screen.dart';
import '../StudentDetails/UI/students_list_ui.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 250,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle settings button click
            },
          ),
        ],
        title: const Text(
          'Student Dashboard',
          // Style here, e.g., style: TextStyleConstants.titleText,
          textAlign: TextAlign.justify,
        ),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                'Vikas Popat Karale',
                style: TextStyleConstants.regularStyle,
              ),
              accountEmail: Text('vikaskarale0311@gmail.com',
                  style: TextStyleConstants.regularStyle),
              currentAccountPicture: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black54,
                            offset: Offset(5, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            'image/admin.jpg',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            showToast('Clicked');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                const StudentDetailInformation()));
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.multiply,
                color: Colors.white54,
                image: DecorationImage(
                  image: const AssetImage(
                    'image/logo.png',
                  ),
                  alignment: Alignment.lerp(
                      Alignment.center, Alignment.topRight, 0.80)!,
                  filterQuality: FilterQuality.high,
                  scale: 2.0,
                ),
              ),
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.assessment,
            //     size: 25,
            //   ),
            //   title: const Text('Assessments'),
            //   focusColor: Colors.black12,
            //   onTap: () {
            //     showToast("Assessment Clicked");
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.assignment_turned_in_sharp,
            //     size: 25,
            //   ),
            //   title: const Text('Assignments'),
            //   focusColor: Colors.black12,
            //   onTap: () {
            //     showToast('clicked');
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (_) => const AssignmentDetailsUi()));
            //   },
            // ),
            ListTile(
              // leading: Image.asset(
              //   'images/batch.png',
              //   scale: 2.0,
              //   height: 25,
              //   width: 25,
              // ),
              leading: const Icon(
                // CupertinoIcons.
               Icons.flight_class_rounded,
                size: 25,
              ),
              title: const Text('Batches'),
              focusColor: Colors.black12,
              onTap: () {
                showToast('clicked');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const BatchDetailsUI()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book_sharp,
                size: 25,
              ),
              title: const Text('News'),
              focusColor: Colors.black12,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const ArticlesDetailsPage(
                      newsCode: 29,
                    )));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.feedback,
                size: 25,
              ),
              title: const Text('Feedback'),
              focusColor: Colors.black45,
              onTap: () {
                showToast('Clicked');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FeedBackUi()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                size: 25,
              ),
              title: const Text('Placement Calls'),
              focusColor: Colors.black45,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const PlacementDetailScreen(courserId1: 0)));
                showToast('Placement call Clicked');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.message,
                size: 25,
              ),
              title: const Text('Message'),
              focusColor: Colors.black45,
              onTap: () {
                showToast('Clicked');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const StudentMessageServiceUI(
                      messageid: 0,
                    )));
              },
            ),
            // const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                Icons.lock_reset,
                size: 25,
              ),
              title: const Text('Update Password'),
              focusColor: Colors.black45,
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (_) =>  const StudentDetailInformation()));
                showToast("Update Password Clicked");
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.logout_sharp,
                  size: 25,
                ),
                title: const Text('Logout'),
                focusColor: Colors.black45,
                onTap: () async {
                  showToast('Logout');
                  SharedPreferences preferences =
                  await SharedPreferences.getInstance();
                  await preferences.clear();
                  print(preferences.clear());
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const LoginForm(),
                    ),
                  );
                }),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Carousel(), // Add the image carousel here
            // ... Other widgets for your main screen
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int _activePage = 1;
  final List<String> _images = [


    "https://www.bitcode.in/images/banner/android_training_in_pune_1920x1080.jpg",
    "https://www.bitcode.in/images/banner/bitcode-best-training-company-pune.jpg",
     "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
     "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            itemCount: _images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _activePage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildSlider(index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildIndicators(),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.80, // Set the desired height for the ListView
          child: Container(
            // color: Theme.of(context).primaryColor,
            child: SingleChildScrollView( // Wrap with SingleChildScrollView
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 50,
                  children:
                    _buildDashboardItems(),
                    // Add more items here as needed
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDashboardItems() {
    return [
      _buildClickableItem('Video', CupertinoIcons.video_camera_solid, Colors.green, () {

        showToast('clicked');
        print('Analytics item clicked');
      }),
      _buildClickableItem('Photos', CupertinoIcons.photo, Colors.purple, () {

        showToast('clicked');
        print('Audience item clicked');
      }),
      _buildClickableItem('Recruiters', CupertinoIcons.chat_bubble_2, Colors.brown, () {
        Navigator.push(
          context,
        MaterialPageRoute(
          builder: (context) => RecruitersScreen(),
        ),
          );
        print('Comments item clicked');
      }),
      // _buildClickableItem('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo, () {
      //   print('Revenue item clicked');
      // }),
      _buildClickableItem('Upload', CupertinoIcons.add_circled, Colors.teal, () {
        print('Upload item clicked');
      }),
      _buildClickableItem('About', CupertinoIcons.question_circle, Colors.blue, () {
        print('About item clicked');
      }),
      _buildClickableItem('Contact', CupertinoIcons.phone, Colors.pinkAccent, () {
        print('Contact item clicked');
      }),
    ];
  }

  Widget _buildClickableItem(String title, IconData iconData, Color background, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: buildDashboardItem(title, iconData, background),
    );
  }

  // List<Widget> _buildDashboardItems() {
  //   return [
  //     _buildClickableItem('Analytics', CupertinoIcons.graph_circle, Colors.green, () {
  //       print('Analytics item clicked');
  //     }),
  //     _buildClickableItem('Audience', CupertinoIcons.person_2, Colors.purple, () {
  //       print('Audience item clicked');
  //     }),
  //     _buildClickableItem('Comments', CupertinoIcons.chat_bubble_2, Colors.brown, () {
  //       print('Comments item clicked');
  //     }),
  //     _buildClickableItem('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo, () {
  //       print('Revenue item clicked');
  //     }),
  //     _buildClickableItem('Upload', CupertinoIcons.add_circled, Colors.teal, () {
  //       print('Upload item clicked');
  //     }),
  //     _buildClickableItem('About', CupertinoIcons.question_circle, Colors.blue, () {
  //       print('About item clicked');
  //     }),
  //     _buildClickableItem('Contact', CupertinoIcons.phone, Colors.pinkAccent, () {
  //       print('Contact item clicked');
  //     }),
  //   ];
  // }
  //
  // Widget _buildClickableItem(String title, IconData iconData, Color background, void Function() onTap) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: _buildDashboardItem(title, iconData, background),
  //   );
  // }

  Widget _buildSlider(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(_activePage == index ? 10 : 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(_images[index])),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    return List.generate(_images.length, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: _activePage == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  Widget buildDashboardItem(String title, IconData iconData,
      Color background) => Container(
    decoration: BoxDecoration(
      color: Colors.white, // Set the desired background color here
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme
              .of(context)
              .primaryColor
              .withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    ),
  );
}
*/
