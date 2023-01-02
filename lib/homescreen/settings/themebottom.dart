import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class themebottomsheet extends StatefulWidget {
  @override
  State<themebottomsheet> createState() => _BottumsheetState();
}

class _BottumsheetState extends State<themebottomsheet> {
  Widget build(BuildContext context) {
    var provider = Provider.of<Listprovider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                provider.changtheme(ThemeMode.light);
              },
              child: provider.apptheme == ThemeMode.light
                  ? selctedlanguage(AppLocalizations.of(context)!.light)
                  : unselctedlanguage(AppLocalizations.of(context)!.light),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  provider.changtheme(ThemeMode.dark);
                },
                child: provider.darkmode()
                    ? selctedlanguage(AppLocalizations.of(context)!.dark)
                    : unselctedlanguage(AppLocalizations.of(context)!.dark))
          ],
        ),
      ),
    );
  }

  Widget selctedlanguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$text',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        Icon(Icons.check)
      ],
    );
  }

  Widget unselctedlanguage(String text) {var provider = Provider.of<Listprovider>(context);
    return Text(
      '$text',
      style: Theme.of(context).primaryTextTheme.headline2!.copyWith(color:provider.apptheme==ThemeMode.light?  Colors.black:Colors.white),
    );
  }
}
