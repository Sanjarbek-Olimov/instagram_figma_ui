import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_figma_ui/pages/profile_page.dart';
import 'package:instagram_figma_ui/pages/theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder:
            (BuildContext context, ThemeModel themeNotifier, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.isDark?ThemeMode.dark:ThemeMode.light,
            theme: ThemeData(
                primaryColor: const Color(0xff262626),
                cardColor: const Color(0xffC7C7CC),
                backgroundColor: const Color(0xffFAFAFA),
                fontFamily: "Sf Display Pro"
            ),
            darkTheme: ThemeData(
                primaryColor: const Color(0xffF9F9F9),
                cardColor: const Color(0xff48484A),
                backgroundColor: const Color(0xff121212),
                fontFamily: "Sf Display Pro"
            ),
            home: const ProfilePage(),
            routes: {
              ProfilePage.id: (context) => const ProfilePage()
            },
          );
        },
      ),
    );


  }
}