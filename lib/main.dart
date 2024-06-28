import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spur/views/auth/onboard.dart';
import 'package:spur/views/widgets/colors.dart';
import 'package:upgrader/upgrader.dart';

import 'core/models/country_model.dart';
import 'core/models/navigator.dart';
import 'core/storage/local_storage.dart';
import 'locator.dart';

List<Country> allCountries = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader().initialize();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  await AppCache.init(); //Initialize Hive

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, builder) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spur',
          theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
            dialogBackgroundColor: AppColors.white,
            bottomSheetTheme:
                const BottomSheetThemeData(surfaceTintColor: Colors.white),
            datePickerTheme:
                const DatePickerThemeData(surfaceTintColor: Colors.white),
            popupMenuTheme:
                const PopupMenuThemeData(surfaceTintColor: Colors.white),
            dialogTheme: const DialogTheme(
                backgroundColor: Colors.white, surfaceTintColor: Colors.white),
            colorScheme: const ColorScheme.light(primary: AppColors.primary),
            primaryColor: AppColors.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          ),
          navigatorKey: AppNavigator.navKey,
          home: const Onboard(),
        ),
      ),
    );
  }
}
