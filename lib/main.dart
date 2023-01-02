
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Themeofapp.dart';
import 'package:todo_app/homescreen/Home_scree.dart';
import 'package:todo_app/homescreen/task/edittask.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(create: (context)=>Listprovider(),child: App()));
}
class App extends StatelessWidget {
  late Listprovider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Listprovider>(context);
   // getshared();
    return MaterialApp(
        theme: apptheme.lightmode,
        darkTheme: apptheme.darkmode,
        routes: {
          Homescreen.routname: (context) => Homescreen(),
          edittask.reoutname: (context) => edittask(),
        },
        initialRoute: Homescreen.routname,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.languge),
        themeMode: provider.apptheme
    );
  }
  // getshared()async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String applang = prefs.getString('lang') ?? 'en';
  //   provider.changlanguge(applang);
  //   String? appthemee = prefs.getString('theme');
  //   if (applang == 'light') {
  //     provider.changtheme(ThemeMode.light);
  //   } else if (applang == 'dark') {
  //     provider.changtheme(ThemeMode.dark);
  //   }
 // }
}

