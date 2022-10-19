import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.bottomNavigationColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: AppColors.bottomNavigationColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey)
      ),
      
      routes: {
      '/auth': (BuildContext context) => AuthWidget(),
      '/main_screen': (BuildContext context) => MainScreenWidget(),      
    },
      initialRoute: '/auth',
    );
  }
}
