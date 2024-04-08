import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/mvvm/utils/routes/routes_name.dart';
import 'package:state_management/mvvm/view/login_screen.dart';
import 'package:state_management/mvvm/view_model/auth_view_model.dart';
import 'package:state_management/provider/auth_provider.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/example_one_provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/provider/theme_change_provider.dart';
import 'package:state_management/screens/dark_theme.dart';
import 'package:state_management/screens/favourite/favourite_screen.dart';
import 'package:state_management/screens/login_screen.dart';
import 'package:state_management/screens/value_notify_listner.dart';

import 'mvvm/utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: Builder(
        builder: (BuildContext context){
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            initialRoute: RoutesName.login,
            onGenerateRoute: Routes.generateRoute,
          );
        },

      ),
    );
  }
}
