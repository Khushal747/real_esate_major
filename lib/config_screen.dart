import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_major/front_page.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/pages/root_seller.dart';
import 'package:real_estate_major/pages/root_buyer.dart';
import 'package:real_estate_major/provider_page.dart';
import 'package:real_estate_major/state_update_provier.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateUpdateProvider()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
            platform: TargetPlatform.iOS,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: Colors.white,
              // hoverColor: Colors.redAccent,
              // splashColor: Colors.tealAccent,
            ),
            datePickerTheme: const DatePickerThemeData(
              headerHeadlineStyle: TextStyle(
                fontSize: 5,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            colorScheme: ColorScheme.light(
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              centerTitle: true,
              elevation: 0,
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyLarge: ThemeData.light().textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                  bodyMedium: ThemeData.light().textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                  displayLarge:
                      ThemeData.light().textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                          ),
                  displayMedium:
                      ThemeData.light().textTheme.displayMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                          ),
                  displaySmall:
                      ThemeData.light().textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                          ),
                  headlineMedium:
                      ThemeData.light().textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 27,
                            fontFamily: "Montserrat",
                          ),
                  headlineSmall:
                      ThemeData.light().textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                          ),
                  titleLarge: ThemeData.light().textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                  titleMedium:
                      ThemeData.light().textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                          ),
                  titleSmall: ThemeData.light().textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                  bodySmall: ThemeData.light().textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                  labelLarge: ThemeData.light().textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                  labelSmall: ThemeData.light().textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                ),
            fontFamily: "Montserrat",
          ),
          home: ProviderPage(
            child: (Logic.user != null)
                ? Logic.user['isSeller']
                    ? RootAppSeller()
                    : RootAppBuyer()
                : FrontPage(),
          ),
        ),
      ),
    );
  }
}
