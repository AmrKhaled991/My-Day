import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../task/taskprovider.dart';
class modalsheet extends StatefulWidget {
  @override
  State<modalsheet> createState() => _modalsheetState();
}

class _modalsheetState extends State<modalsheet> {
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
                provider.changlanguge('en');
              },
              child: provider.languge == 'en'
                  ? selctedlanguage(AppLocalizations.of(context)!.english)
                  : unselctedlanguage(AppLocalizations.of(context)!.english),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  provider.changlanguge('ar');
                },
                child: provider.languge == 'ar'
                    ? selctedlanguage(AppLocalizations.of(context)!.arabic)
                    : unselctedlanguage(AppLocalizations.of(context)!.arabic))
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
