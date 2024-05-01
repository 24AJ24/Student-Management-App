/*
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class  GetConnectivity extends StatefulWidget{

  @override
  State<GetConnectivity> createState() => GetConnectivityState();
}

class GetConnectivityState  extends State<GetConnectivity>{

  late StreamSubscription subscription;
  bool  isDeviceConnected = false;
  bool isAlertSet= false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  @override
  void dispose() {
    // Disable the WakeLock when the widget is removed from the tree
    subscription.cancel();
    super.dispose();
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
    return const Material(


    );


  }

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






*/
