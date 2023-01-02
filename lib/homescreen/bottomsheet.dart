import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/homescreen/firebase/firebas_useing.dart';
import 'package:todo_app/homescreen/firebase/firebasetask.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class appbottomsheet extends StatefulWidget {


  @override
  State<appbottomsheet> createState() => _appbottomsheetState();
}

class _appbottomsheetState extends State<appbottomsheet> {

  DateTime selcteddate = DateTime.now();
  String decraption='';
  String title='';


var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {var provider=Provider.of<Listprovider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(textAlign: TextAlign.center,
              AppLocalizations.of(context)!.addnewtask, style: Theme
                  .of(context)
                  .primaryTextTheme
                  .headline2!
                  .copyWith(color: provider.apptheme==ThemeMode.light?  Colors.black:Colors.white, fontSize: 20),
            ),
            TextFormField(
                onChanged: (value) =>title=value ,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return value =   AppLocalizations.of(context)!.task;
                }
              },
              decoration: InputDecoration(hintText:  AppLocalizations.of(context)!.task,hintStyle: TextStyle(color:provider.apptheme==ThemeMode.light?  Colors.black:Colors.white) )),
            SizedBox(height: 2,),
            TextFormField(
              onChanged: (value) =>decraption=value ,
              validator: (value)  {
              if(value!.isEmpty || value==null){
                return value= AppLocalizations.of(context)!.discraption;
              }
              },
              decoration: InputDecoration(hintText: AppLocalizations.of(context)!.discraption,hintStyle:
              TextStyle(color:provider.apptheme==ThemeMode.light?  Colors.black:Colors.white)),
              maxLines: 4,
              minLines: 4,
            ),
            Text(
              AppLocalizations.of(context)!.selctdate, style: Theme
                .of(context)
                .primaryTextTheme
                .headline2!
                .copyWith(color: provider.apptheme==ThemeMode.light?  Colors.black:Colors.white, fontSize: 15),
            ),
            InkWell(
              onTap: () {
                ondate();
              },
              child: Text(textAlign: TextAlign.center,
                '${selcteddate.day}/${selcteddate.month}/${selcteddate.year}',style: TextStyle(color:provider.apptheme==ThemeMode.light?  Colors.black:Colors.white),
              ),
            ),
            SizedBox(height: 25,),
            ElevatedButton(
                onPressed: () {
                  addtask();
                },
                child: Text(AppLocalizations.of(context)!.add,style: TextStyle(color:provider.apptheme==ThemeMode.light?  Colors.black:Colors.white))
            )
          ],
        ),
      ),

    );
  }

  void ondate() async {
    var chosedate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365),

        )
    );
    if (chosedate != null) {
      selcteddate = chosedate;
    }
    setState(() {
    });
  }

  void addtask() {
    if(formkey.currentState!.validate()){
      Task task=Task(title: title, time: selcteddate.microsecondsSinceEpoch, decraption: decraption, isdone: true);
      addtaskfirestore(task).timeout(Duration(microseconds: 500),onTimeout: (){
        Navigator.of(context).pop(context);
      });
    }
  }
}

