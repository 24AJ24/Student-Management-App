import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Commons/drawer_state_provider.dart';
import 'SplachScreen/splach_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DrawerStateProvider(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}


/*


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String companyWebsite = "https://example.com"; // Replace with your website URL

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Company Website Link'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (await canLaunch(companyWebsite)) {
                    await launch(companyWebsite);
                  } else {
                    throw 'Could not launch $companyWebsite';
                  }
                },
                child: Text(
                  'Visit Company Website',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
