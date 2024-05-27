import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.dark,
  // );
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    S.load(const Locale("en"));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TikTok Clone',
        localizationsDelegates: const [
          S.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en"),
          Locale("ko"),
          Locale("es"),
        ],
        themeMode: ThemeMode.system,
        theme: ThemeData(
          brightness: Brightness.light,
          textTheme: Typography.blackMountainView,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
          // splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
          ),
          listTileTheme: const ListTileThemeData(iconColor: Colors.black),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          textTheme: Typography.whiteMountainView,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.grey.shade900,
            backgroundColor: Colors.grey.shade900,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
          scaffoldBackgroundColor: Colors.black,
          primaryColor: const Color(0xFFE9435A),
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade500,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
          useMaterial3: true,
        ),
        home: const SignUpScreen());
  }
}
