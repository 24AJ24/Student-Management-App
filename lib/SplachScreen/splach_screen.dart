/*
import 'dart:async';
import 'package:wakelock/wakelock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../Auth/Model/login_response_model.dart';
import '../Auth/UI/login_form_ui.dart';
import '../Config/palette.dart';
import '../HomeScreen/home_screen_ui.dart';
import '../Util/show_toast.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String keyLogin = 'Login';
  LoginResponseModel? apiResponseData;

  @override
  void initState() {
    super.initState();
    _whereToGO();
    Wakelock.enable();    // Enable the WakeLock when the widget is created
// print(sharedPref);
  }

  @override
  void dispose() {
    // Disable the WakeLock when the widget is removed from the tree
    Wakelock.disable();
    super.dispose();
  }

  Future<bool> onwillPop() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/logo.png',
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            const Center(
              child: Text(
                'Bitcode',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 37,
                    color: Palette.linkedinColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _whereToGO() => Timer(const Duration(seconds: 2), () async {

    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(keyLogin);

    //apiResponseData= await fetchApiData();
    if (isLoggedIn != null) {

      if (isLoggedIn) {

        print(isLoggedIn);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginForm(),
            ));
        showToast(sharedPref as String);
        print(SharedPreferences);
        //print(AppData.apiResponseData);
      }
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginForm(),
          ));
    }
  });
}
*/
///sdf
///
///
///
///
///

/*
import 'dart:async';
import 'dart:ffi';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wakelock/wakelock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../Auth/Model/login_response_model.dart';
import '../Auth/UI/login_form_ui.dart';
import '../Commons/connectivity.dart';
import '../Config/palette.dart';
import '../HomeScreen/home_screen_ui.dart';
import '../Util/show_toast.dart';

// Define the LoginData class at the top level
class LoginData {
  final String username;
  final String token;
  final int studentId;
  final String studentName;
  final  int enrollmentId;
  final  int studentGender;
  final String imageUrl;
  final int courseId;
  final int batchId;

  LoginData(this.username, this.token,   this.studentId,
       this.studentName,
       this.enrollmentId,
       this.studentGender,
       this.imageUrl,
       this.courseId,
       this.batchId,
       );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // Define a key for the 'isLoggedIn' value in SharedPreferences
  static const String keyLogin = 'isLoggedIn';
// static const String keyLogin = 'isLoggedIn';

  // Add a method to save login data to SharedPreferences
  Future<void> saveLoginData(LoginData loginData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyLogin, true); // Mark as logged in
    await prefs.setString('username', loginData.username);
    await prefs.setString('token', loginData.token);
    await prefs.setInt('studentId', loginData.studentId);
    await prefs.setInt('enrollmentId', loginData.enrollmentId);
    await prefs.setInt('courseId', loginData.courseId);
    await prefs.setInt('batchId', loginData.batchId);

  }

  // Add a method to retrieve login data from SharedPreferences
 */
/* Future<LoginData?> getLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool(keyLogin) ?? false;
    if (isLoggedIn) {
      final String username = prefs.getString('username') ?? '';
      final String token = prefs.getString('token') ?? '';
      final String studentId = prefs.getString('studentId') ?? '';
      final String enrollmentId = prefs.getString('enrollmentId') ??  '';
      final String courseId = prefs.getString('courseId') ??  '';

      return LoginData(username, token, studentId as int, courseId, enrollmentId as int);

    } else {
      return null;
    }
  }*//*


  Future<LoginData?> getLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool(keyLogin) ?? false;
    if (isLoggedIn) {
      final String username = prefs.getString('username') ?? '';
      final String token = prefs.getString('token') ?? '';
      final int studentId = prefs.getInt('studentId') ?? 0;
      final String studentName = prefs.getString('studentName') ?? '';
      final int enrollmentId = prefs.getInt('enrollmentId') ?? 0;
      final int studentGender = prefs.getInt('studentGender') ?? 0;
      final String imageUrl = prefs.getString('imageUrl') ?? '';
      final int courseId = prefs.getInt('courseId') ?? 0;
      final int batchId = prefs.getInt('batchId') ?? 0;

      return LoginData(
        username,
        token,
        studentId,
        studentName,
        enrollmentId,
        studentGender,
        imageUrl,
        courseId,
        batchId,
      );
    } else {
      return null;
    }
  }


  @override
  void initState() {
    super.initState();
    _whereToGO();
  }

  // Your _whereToGO method with modifications
  void _whereToGO() => Timer(const Duration(seconds: 2), () async {
    // Check if the user is logged in
    LoginData? loginData = await getLoginData();

    if (loginData != null) {
      // User is logged in, navigate to the main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    } else {
      // User is not logged in, navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginForm(),
        ),
      );
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... your existing build method code ...
    );
  }
}
*/

///
///



import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wakelock/wakelock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../Auth/Model/login_response_model.dart';
import '../Auth/UI/login_form_ui.dart';
import '../Commons/connectivity.dart';
import '../Config/palette.dart';
import '../HomeScreen/home_screen_ui.dart';
import '../Util/show_toast.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  bool  isDeviceConnected = false;
  bool isAlertSet= false;
  late StreamSubscription subscription;
  static const String keyLogin = 'Login';
  LoginResponseModel? apiResponseData;

  @override
  void initState() {
    super.initState();
    _whereToGO();

    Wakelock.enable();
    getConnectivity();
    // Enable the WakeLock when the widget is created
// print(sharedPref);
  }

  @override
  void dispose() {
    // Disable the WakeLock when the widget is removed from the tree
    Wakelock.disable();
    subscription.cancel();
    super.dispose();
  }

  Future<bool> onwillPop() async {
    return true;
  }

  getConnectivity() =>  subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isAlertSet == false) {
        showDialogBox();
        setState(() => isAlertSet = true);
      }
    },
  );



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/logo.png',
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            const Center(
              child: Text(
                'Bitcode',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 37,
                    color: Palette.linkedinColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _whereToGO() => Timer(const Duration(seconds: 2), () async {

    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(keyLogin);

    //apiResponseData= await fetchApiData();
    if (isLoggedIn != null) {

      // var sharedPref = await SharedPreferences.getInstance();
      // var username = sharedPref.getString('username');
      // var token = sharedPref.getString('token');
      // print('Data retrieved successfully - Username: $username, Token: $token');

      print ('isLoggedIn: $isLoggedIn' );
      if (isLoggedIn) {
        // var sharedPref = await SharedPreferences.getInstance();
        // var username = sharedPref.getString('username');
        // var token = sharedPref.getString('token');
        // print('Data retrieved successfully - Username: $username, Token: $token');
        print(isLoggedIn);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MainScreen(),
              // builder: (context) => const MainScreen(),
            ));
        print('////');
        print('username : ${sharedPref.getString('username')}');
        print('token : ${sharedPref.getString('token')}');
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginForm(),
            ));
        // showToast(sharedPref as String);
        print('////');
print('username : ${sharedPref.getString('username')}');
        print('token : ${sharedPref.getString('token')}');

        print(SharedPreferences);
        //print(AppData.apiResponseData);
      }
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginForm(),
          ));
    }
  });

  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}




///
///
///
///
///
///
///
///
/*import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wakelock/wakelock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../Auth/Model/login_response_model.dart';
import '../Auth/UI/login_form_ui.dart';
import '../Commons/connectivity.dart';
import '../Config/palette.dart';
import '../HomeScreen/home_screen_ui.dart';
import '../Util/show_toast.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  bool  isDeviceConnected = false;
  bool isAlertSet= false;
  late StreamSubscription subscription;
  static const String keyLogin = 'Login';
  LoginResponseModel? apiResponseData;

  @override
  void initState() {
    super.initState();
    _whereToGO();

    Wakelock.enable();
    getConnectivity();
    // Enable the WakeLock when the widget is created
// print(sharedPref);
  }

  @override
  void dispose() {
    // Disable the WakeLock when the widget is removed from the tree
    Wakelock.disable();
    subscription.cancel();
    super.dispose();
  }

  Future<bool> onwillPop() async {
    return true;
  }

  getConnectivity() =>  subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isAlertSet == false) {
        showDialogBox();
        setState(() => isAlertSet = true);
      }
    },
  );



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/logo.png',
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            ),
            const Center(
              child: Text(
                'Bitcode',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 37,
                    color: Palette.linkedinColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _whereToGO() => Timer(const Duration(seconds: 2), () async {

    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(keyLogin);

    //apiResponseData= await fetchApiData();
    if (isLoggedIn != null) {

      if (isLoggedIn) {

        print(isLoggedIn);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MainScreen(),
              // builder: (context) => const MainScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginForm(),
            ));
        showToast(sharedPref as String);
        print(SharedPreferences);
        //print(AppData.apiResponseData);
      }
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginForm(),
          ));
    }
  });

  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}*/


