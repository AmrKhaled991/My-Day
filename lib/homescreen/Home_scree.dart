
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Themeofapp.dart';
import 'package:todo_app/homescreen/settings/settings.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';
import 'package:todo_app/homescreen/task/tasks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bottomsheet.dart';

class Homescreen extends StatefulWidget {
static String routname='reout1';


  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
int page=0;

  @override
  Widget build(BuildContext context) {    var provider=Provider.of<Listprovider>(context);

  return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todolist,style: Theme.of(context).primaryTextTheme.headline2!.copyWith(fontSize: 25)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          onbottomsheet();
          setState(() {

          });
        },
        child: Icon(Icons.add),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.white,width: 4)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(color: provider.apptheme==ThemeMode.light?  Colors.white:apptheme.darkitemcolor,
        shape: CircularNotchedRectangle(
        ),
        notchMargin: 5,
        child: BottomNavigationBar(
          onTap: (index){
            page=index;
            setState(() {

            });
          },
          currentIndex:page,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu,),label: 'menu'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings,),label: "settings"
            )
          ],
        ),
      ),
      body: screens[page],
    );
  }
onbottomsheet() {
  showModalBottomSheet(
    builder:(context) => appbottomsheet(),
    context: context,

  );
}
}


List<Widget>screens=[
  apptasks(),appsettings()
];