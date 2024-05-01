import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../HomeScreen/home_screen_ui.dart';
import 'drawer_state_provider.dart';


void navigateToMainScreen(BuildContext context) {
  final drawerStateProvider = Provider.of<DrawerStateProvider>(context, listen: false);
  drawerStateProvider.setDrawerOpen(true);

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (_) => const MainScreen(),
    ),
  );
}
