import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Themeofapp.dart';
import 'package:todo_app/homescreen/settings/sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/homescreen/settings/themebottom.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';
class appsettings extends StatefulWidget {

  @override
  State<appsettings> createState() => _appsettingsState();
}

class _appsettingsState extends State<appsettings> {
  @override
  Widget build(BuildContext context) {var provider=Provider.of<Listprovider>(context);
    return Container(margin: EdgeInsets.all(25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style:
          Theme.of(context).primaryTextTheme.headline2!.copyWith(color: provider.apptheme==ThemeMode.light?  Colors.black:Colors.white),)
          ,SizedBox(height: 5,)
          ,InkWell(
            onTap: (){
              bottomsheet();
            },
            child: Container(padding:EdgeInsets.all(8) ,margin: EdgeInsets.all(7),
              decoration: BoxDecoration(color: provider.apptheme==ThemeMode.light?  Colors.white:apptheme.darkitemcolor,border: Border.all(color:Theme.of(context).primaryColor,width: 2 )),
              child: Text(provider.languge=='ar'?
                AppLocalizations.of(context)!.arabic:AppLocalizations.of(context)!.english
                ,style: Theme.of(context).primaryTextTheme.headline2!.copyWith
                (color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400),),
            ),
          )
        ,SizedBox(height: 10,),
          Text(AppLocalizations.of(context)!.theming,style:
          Theme.of(context).primaryTextTheme.headline2!.copyWith(color:provider.apptheme==ThemeMode.light?  Colors.black:Colors.white),)
          ,SizedBox(height: 5,)
          ,InkWell(onTap: (){
            theemesheet();
          },
            child: Container(padding:EdgeInsets.all(8) ,margin: EdgeInsets.all(7),
              decoration: BoxDecoration(color: provider.apptheme==ThemeMode.light?  Colors.white:apptheme.darkitemcolor,border: Border.all(color:Theme.of(context).primaryColor,width: 2 )),
              child: Text(provider.apptheme==ThemeMode.light?
              AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark ,style: Theme.of(context).primaryTextTheme.headline2!.copyWith
                (color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400),),
            ),
          )
        ],
      ),
     );
  }
  bottomsheet(){
    showModalBottomSheet(
        context: context,
        builder: (context) => modalsheet());
  }

  void theemesheet() {
    showModalBottomSheet(context: context,
        builder: (context) => themebottomsheet());
  }
 }
