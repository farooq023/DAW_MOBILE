import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './providers/Dashboardpro.dart';
import './providers/languageProvider.dart';
import 'Providers/inboxPro.dart';
import 'Providers/HistoryProvider.dart';

import './screens/SplashScreen.dart';
import './screens/Login.dart';
import './screens/Login2.dart';
import './screens/Dashboard.dart';
import './screens/PdfKit.dart';
import './screens/Settings.dart';
// import './screens/Inbox.dart';

import './screens/Inbox/Inbox.dart';
import './screens/Sent/Sent.dart';

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
        ChangeNotifierProvider.value(
          value: LanguageProvider(),
        ),
        ChangeNotifierProvider.value(
          value: DashboardPro(),
        ),
        ChangeNotifierProvider.value(
          value: InboxPro(),
        ),
        ChangeNotifierProvider.value(
          value: HistoryPro(),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (ctx, lang, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DAW Mobile',
          theme: ThemeData(
            primaryColor: const Color(0xFF1976D2),
            // primaryColor: Color.fromARGB(255, 85, 139, 194),
            backgroundColor: const Color.fromARGB(255, 237, 244, 250),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
            // Locale('es'),
          ],
          locale: LanguageProvider.appLocale,
          home: SplashScreen(),
          // home: Login(),
          routes: {
            SplashScreen.routeName: (ctx) => SplashScreen(),
            Login.routeName: (ctx) => Login(),
            Settings.routeName: (ctx) => Settings(),
            Login2.routeName: (ctx) => Login2(),
            Dashboard.routeName: (ctx) => Dashboard(),
            // Inbox.routeName: (ctx) => Inbox(),
            Inbox.routeName: (ctx) => Inbox(),
            // MyHistory.routeName: (ctx) => MyHistory(),
            MySent.routeName: (ctx) => MySent(),
            PdfKit.routeName: (ctx) => PdfKit(),
          },
        ),
      ),
    );
  }
}
