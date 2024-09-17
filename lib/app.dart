import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/core/services/navigation_service.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(),
        ),
      ],
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            SizeConfig().init(context, constraints);
            final themeNotifier = Provider.of<ThemeNotifier>(context);
            return Consumer<ThemeNotifier>(
              builder: (context, theme, child) {
                return MaterialApp(
                  //debugShowMaterialGrid: true,
                  title: 'EvoltSoft',
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  theme: themeNotifier.themeData,
                  darkTheme: themeNotifier.themeData,
                  highContrastTheme: themeNotifier.themeData,
                  highContrastDarkTheme: themeNotifier.themeData,
                  navigatorKey: locator<NavigationService>().navigationKey,
                  onGenerateRoute: onGenerateRoute,
                  initialRoute: widget.initialRoute,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'), // English
                    Locale('hi'),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
