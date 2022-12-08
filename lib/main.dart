
import 'package:cryptocurrency3/lib/View%20Model/Provider/SearchProvider.dart';
import 'package:cryptocurrency3/lib/View%20Model/Provider/thems_provider.dart';
import 'package:cryptocurrency3/lib/View/Screens/Auth_Screens/Register_Screen.dart';

import 'package:cryptocurrency3/lib/View/Screens/Coins_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'lib/Models/ core/thems.dart';
import 'lib/View Model/Provider/Details_provider.dart';
import 'lib/View Model/Provider/Home_Provider.dart';
import 'lib/View Model/Provider/auth_provider.dart';
import 'lib/View Model/Provider/photo_provider.dart';
import 'lib/View/Screens/Auth_Screens/Login_Screen.dart';

Future<void> main() async {

  HomeProvider().getallcoin();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  HomeProvider().getallcoin();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ChangeNotifierProvider(create: (context) => DetailsProvider(),),
    ChangeNotifierProvider(create: (context) => Auth_Provider(),),
    ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ChangeNotifierProvider(create: (context) => SearchProvider(),),
    ChangeNotifierProvider(create: (context) => PhotoProvider(),),
  ],child:MyApp() ,));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false).getThemeModeFromSharedPref();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        home:Register_Screen()
    );
  }
}

