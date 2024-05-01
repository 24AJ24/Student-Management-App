import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Commons/loading_dialog.dart';
import '../../ForgotPassword/Bloc/forgot_password_bloc.dart';
import '../../HomeScreen/home_screen_ui.dart';
import '../../SplachScreen/splach_screen.dart';
import '../Bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool rememberMe = false;
  SharedPreferences? prefs;
  final usernameTextFieldBLoc = TextFieldBloc();
  final passwordTextFieldBloc = TextFieldBloc();
  bool isButtonClicked = false; // State variable for button click

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final loginFormBloc = context.read<LoginFormBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Student Login'),
              centerTitle: true,
              //leading: Container(),
            ),
            body: FormBlocListener<LoginFormBloc, String, String>(
              onSubmitting: (context, state) {
                LoadingDialog.show(context);
              },
              onSubmissionFailed: (context, state) {
                LoadingDialog.hide(context);
              },
              onSuccess: (context, state) async {
                LoadingDialog.hide(context);
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.keyLogin, true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                );
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failureResponse!)),
                );
              },
              child: SingleChildScrollView(
                //padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                physics: const ClampingScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFECF3F9),
                        Color(0xFFECF3F9),
                        //Palette.darkBlueGradientColor,
                        //Palette.darkBlueGradientColor,
                        // Colors.
                        //Colors.red.withOpacity(1.0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 36.0, horizontal: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BitCode',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 46.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Student Login',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFieldBlocBuilder(
                                  keyboardType: TextInputType.emailAddress,
                                  textFieldBloc: loginFormBloc.username,
                                  autofillHints: const [
                                    AutofillHints.username,
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Email',
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                TextFieldBlocBuilder(
                                  textFieldBloc: loginFormBloc.password,
                                  suffixButton: SuffixButton.obscureText,
                                  autofillHints: const [AutofillHints.password],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: false,
                                    fillColor: Colors.transparent,
                                    hintText: 'Password',
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                ),

                                // Forgot Password button on the right side
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordScreen(),
                                        ),
                                      );
                                      // Implement Forgot Password functionality here
                                      // For example, show a reset password dialog
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                                // Login button with color change and animation
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isButtonClicked = true;
                                    });
                                    loginFormBloc.submit();
                                    // Add your login logic here
                                    // Example: Call a function to perform login
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isButtonClicked
                                        ? Colors.white
                                        : Colors.blue,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    elevation: 8,
                                  ),
                                  child: AnimatedDefaultTextStyle(
                                    softWrap: true,
                                    duration: const Duration(milliseconds: 300),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: isButtonClicked
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    child: const Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

///
///
///
///
///
///
///
///
///
/*
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Commons/loading_dialog.dart';
import '../../ForgotPassword/Bloc/forgot_password_bloc.dart';
import '../../ForgotPassword/Model/forgot_password_model.dart';
import '../../HomeScreen/home_screen_ui.dart';
import '../../SplachScreen/splach_screen.dart';
import '../Bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}
class LoginFormState extends State<LoginForm> {
  bool rememberMe = false;
  final usernameTextFieldBloc = TextFieldBloc();
  final passwordTextFieldBloc = TextFieldBloc();
  bool isButtonClicked = false; // State variable for button click

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final loginFormBloc = context.read<LoginFormBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Student Login'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFECF3F9),
                      Color(0xFFECF3F9),
                    ],
                    // begin: Alignment.topRight,
                    // end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 36.0,
                          horizontal: 24.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'BitCode',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 46.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Student Login',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFieldBlocBuilder(
                                keyboardType: TextInputType.emailAddress,
                                textFieldBloc: loginFormBloc.username,
                                autofillHints: const [AutofillHints.username],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hintText: 'Email',
                                  prefixIcon: const Icon(Icons.email_outlined),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextFieldBlocBuilder(
                                textFieldBloc: loginFormBloc.password,
                                suffixButton: SuffixButton.obscureText,
                                autofillHints: const [AutofillHints.password],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: false,
                                  fillColor: Colors.transparent,
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.password),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isButtonClicked = true;
                                  });
                                  loginFormBloc.submit();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isButtonClicked ? Colors.white : Colors.blue,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  elevation: 8,
                                ),
                                child: AnimatedDefaultTextStyle(
                                  softWrap: true,
                                  duration: const Duration(milliseconds: 300),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: isButtonClicked ? Colors.black : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  child: const Text('Login'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
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
///
///
///
///
///
///
///
///
///
///
///
// /*import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Commons/loading_dialog.dart';
// import '../../Config/palette.dart';
// import '../../ForgotPassword/Bloc/forgot_password_bloc.dart';
// import '../../ForgotPassword/Model/forgot_password_model.dart';
// import '../../HomeScreen/home_screen_ui.dart';
// import '../../SplachScreen/splach_screen.dart';
// import '../Bloc/login_bloc.dart';
//
// class LoginForm extends StatefulWidget {
//   const LoginForm({Key? key}) : super(key: key);
//
//   @override
//   LoginFormState createState() => LoginFormState();
// }
//
// class LoginFormState extends State<LoginForm> {
//   bool rememberMe = false;
//   SharedPreferences? prefs;
//   final usernameTextFieldBLoc = TextFieldBloc();
//   final passwordTextFieldBloc = TextFieldBloc();
//   bool isButtonClicked = false; // State variable for button click
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginFormBloc(),
//       child: Builder(
//         builder: (context) {
//           final loginFormBloc = context.read<LoginFormBloc>();
//           return Scaffold(
//             resizeToAvoidBottomInset: false,
//             appBar: AppBar(
//               title: const Text('Student Login'),
//               centerTitle: true,
//               //leading: Container(),
//             ),
//             body: FormBlocListener<LoginFormBloc, String, String>(
//               onSubmitting: (context, state) {
//                 LoadingDialog.show(context);
//               },
//               onSubmissionFailed: (context, state) {
//                 LoadingDialog.hide(context);
//               },
//               onSuccess: (context, state) async {
//                 LoadingDialog.hide(context);
//                 var sharedPref = await SharedPreferences.getInstance();
//                 sharedPref.setBool(SplashScreenState.keyLogin, true);
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (_) => const MainScreen()),
//                 );
//               },
//               onFailure: (context, state) {
//                 LoadingDialog.hide(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text(state.failureResponse!)),
//                 );
//               },
//               child: SingleChildScrollView(
//
//                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 scrollDirection: axisDirectionToAxis(AxisDirection.up),
//                 physics: const ClampingScrollPhysics(
//                 ),
//                 child: Container(
//
//                   constraints: BoxConstraints(
//                     maxHeight: MediaQuery.of(context).size.height,
//                     maxWidth: MediaQuery.of(context).size.width,
//                     minHeight: MediaQuery.of(context).size.height,
//                     minWidth: MediaQuery.of(context).size.width
//                   ),
//                   decoration:  BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//
//                         // Color(0xFFECF3F9 0xFF0D47A1),
//                         // Color(0xFFECF3F9),
//                         Palette.darkBlueGradientColor,
//                         Palette.darkBlueGradientColor,
//                         // Colors.red.withOpacity(1.0),
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.centerRight,
//                     ),
//                   ),
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Expanded(
//                           flex: 2,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 36.0, horizontal: 24.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'BitCode',
//                                   style: TextStyle(
//                                     color: Colors.black45,
//                                     fontSize: 46.0,
//                                     fontWeight: FontWeight.w900,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10.0),
//                                 Text(
//                                   'Student Login',
//                                   style: TextStyle(
//                                     color: Colors.black45,
//                                     fontSize: 24.0,
//                                     fontWeight: FontWeight.w900,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 5,
//                           child: Container(
//                             width: double.infinity,
//                             decoration: const BoxDecoration(
//                               color: Colors.white54,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(30),
//                                 topRight: Radius.circular(40),
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 TextFieldBlocBuilder(
//                                   keyboardType: TextInputType.emailAddress,
//                                   textFieldBloc: loginFormBloc.username,
//                                   autofillHints: const [
//                                     AutofillHints.username,
//                                   ],
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.transparent,
//                                     hintText: 'Email',
//                                     prefixIcon:
//                                       // Icon(CupertinoIcons.mail)
//                                     const Icon(Icons.email_outlined)
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10.0),
//                                 TextFieldBlocBuilder(
//                                   textFieldBloc: loginFormBloc.password,
//                                   suffixButton: SuffixButton.obscureText,
//                                   autofillHints: const [AutofillHints.password],
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     filled: false,
//                                     fillColor: Colors.transparent,
//                                     hintText: 'Password',
//                                     prefixIcon:
//                                     // Icon(CupertinoIcons.padlock_solid)
//                                     const Icon(Icons.password),
//                                   ),
//                                 ),
//
//                                 // Forgot Password button on the right side
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: TextButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) => const ForgotPasswordScreen(),
//                                               ),
//                                             );
//                                       // Implement Forgot Password functionality here
//                                       // For example, show a reset password dialog
//                                     },
//                                     child: const Text(
//                                       'Forgot Password?',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 // Login button with color change and animation
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       isButtonClicked = true;
//                                     });
//                                     loginFormBloc.submit();
//                                     // Add your login logic here
//                                     // Example: Call a function to perform login
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: isButtonClicked
//                                         ? Colors.white
//                                         : Colors.blue,
//                                     shadowColor: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 40, vertical: 15),
//                                     elevation: 8,
//                                   ),
//                                   child: AnimatedDefaultTextStyle(
//                                     softWrap: true,
//                                     duration: const Duration(milliseconds: 300),
//                                     style: TextStyle(
//
//                                       fontSize: 18.0,
//                                       color: isButtonClicked
//                                           ? Colors.black
//                                           : Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     child: const Text('Login'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ]),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }*/
//TODO:lsakdjfjhdskjlkdsljdskjkfdsjkldsfjlkdsafjlk
/*import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../Bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isButtonClicked = false;
  final usernameTextFieldBloc = TextFieldBloc();
  final passwordTextFieldBloc = TextFieldBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(), // Your form bloc
      child: Builder(
          builder: (context) {
            final loginFormBloc = context.read<LoginFormBloc>();
            return Scaffold(
              appBar: AppBar(
                title: const Text('Login'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'App Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextFieldBlocBuilder(
                        keyboardType: TextInputType.emailAddress,
                        textFieldBloc: loginFormBloc.username,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextFieldBlocBuilder(
                        textFieldBloc: loginFormBloc.password,
                        suffixButton: SuffixButton.obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Implement Forgot Password functionality here
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isButtonClicked =
                          true; // Ensure you are not redefining 'isButtonClicked' here
                        });
                        loginFormBloc.submit();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonClicked ? Colors.grey : Colors
                            .blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: AnimatedDefaultTextStyle(
                        style: TextStyle(
                          fontSize: 18.0,
                          color: isButtonClicked ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        duration: const Duration(milliseconds: 300),
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}*/

/*
🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Commons/loading_dialog.dart';
import '../../HomeScreen/home_screen_ui.dart';
import '../../SplachScreen/splach_screen.dart';
import '../Bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool rememberMe = false;
  SharedPreferences? prefs;
  final usernameTextFieldBLoc = TextFieldBloc();
  final passwordTextFieldBloc = TextFieldBloc();
  bool isButtonClicked = false; // State variable for button click

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final loginFormBloc = context.read<LoginFormBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Student Login'),
              centerTitle: true,
              //leading: Container(),
            ),
            body: FormBlocListener<LoginFormBloc, String, String>(
              onSubmitting: (context, state) {
                LoadingDialog.show(context);
              },
              onSubmissionFailed: (context, state) {
                LoadingDialog.hide(context);
              },
              onSuccess: (context, state) async {
                LoadingDialog.hide(context);
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.keyLogin, true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                );
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failureResponse!)),
                );
              },
              child: SingleChildScrollView(
                //padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                physics: const ClampingScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFECF3F9 */
/*0xFF0D47A1*/ /*
),
                        Color(0xFFECF3F9),
                        //Palette.darkBlueGradientColor,
                        //Palette.darkBlueGradientColor,
                        // Colors.
                        //Colors.red.withOpacity(1.0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 36.0, horizontal: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BitCode',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 46.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Student Login',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFieldBlocBuilder(
                                  keyboardType: TextInputType.emailAddress,
                                  textFieldBloc: loginFormBloc.username,
                                  autofillHints: const [
                                    AutofillHints.username,
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Email',
                                    prefixIcon:
                                    const Icon(Icons.email_outlined),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                TextFieldBlocBuilder(
                                  textFieldBloc: loginFormBloc.password,
                                  suffixButton: SuffixButton.obscureText,
                                  autofillHints: const [AutofillHints.password],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Password',
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                ),

                                // Forgot Password button on the right side
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      // Implement Forgot Password functionality here
                                      // For example, show a reset password dialog
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                                // Login button with color change and animation
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isButtonClicked = true;
                                    });
                                    loginFormBloc.submit();
                                    // Add your login logic here
                                    // Example: Call a function to perform login
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: isButtonClicked
                                        ? Colors.white
                                        : Colors.blue,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    elevation: 8,
                                  ),
                                  child: AnimatedDefaultTextStyle(
                                    softWrap: true,
                                    duration: const Duration(milliseconds: 300),
                                    style: TextStyle(

                                      fontSize: 18.0,
                                      color: isButtonClicked
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    child: const Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
*/
