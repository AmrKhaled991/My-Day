import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Themeofapp.dart';
import 'package:todo_app/homescreen/firebase/firebasetask.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';
class edittask extends StatefulWidget {
 static String reoutname='reut2';
late Listprovider provider;

  @override
  State<edittask> createState() => _edittaskState();
}

class _edittaskState extends State<edittask> {
  var titlecontrol=TextEditingController();
  var descontrol=TextEditingController();
  DateTime tasktime=DateTime.now();
  late Task task;
  var formkey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    task =ModalRoute.of(context)!.settings.arguments as Task;
     tasktime=DateTime.fromMicrosecondsSinceEpoch(task.time);
    titlecontrol.text=task.title;
    descontrol.text=task.decraption;
    setState(() {
    });
    });
  }
  Widget build(BuildContext context) { widget.provider=Provider.of<Listprovider>(context);

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edittask,style: Theme.of(context).primaryTextTheme.headline2),
      ),
     body: Container(padding: EdgeInsets.all(8),margin: EdgeInsets.all(30),
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: widget.provider.apptheme==ThemeMode.light?  Colors.white:apptheme.darkitemcolor),
       child: Form(
         key: formkey,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Text(textAlign: TextAlign.center,
               AppLocalizations.of(context)!.edittask,style: Theme.of(context).primaryTextTheme.headline2!.copyWith(color: widget.provider.apptheme==ThemeMode.light?  Colors.black:Colors.white,fontSize: 20),
             ),
             TextFormField(
                controller: titlecontrol,
               validator: (value)  {
                 if(value!.isEmpty || value==null){
                   return value= AppLocalizations.of(context)!.title;
                 }
               },
             ),
             SizedBox(height: 2,),
             TextFormField(
                controller: descontrol,
               validator: (value)  {
                 if(value!.isEmpty || value==null){
                   return value= AppLocalizations.of(context)!.discraption;
                 }
               },
               maxLines: 4,
               minLines: 4,
             ),
             InkWell(
               onTap: (){
                 selctdate();
               },
               child: Text(
                 AppLocalizations.of(context)!.selctdate,style: Theme.of(context).primaryTextTheme.headline2!.copyWith(color: widget.provider.apptheme==ThemeMode.light?  Colors.black:Colors.white,fontSize: 15),
               ),
             ),
             Text('${tasktime.month}/${tasktime.day}/${tasktime.year}'
            ,textAlign: TextAlign.center,style: Theme.of(context).primaryTextTheme.headline2!.copyWith(color: Colors.black,fontSize: 15), ),
             SizedBox(height: 25,),
             ElevatedButton(
                 onPressed: (){
                   if(formkey.currentState!.validate()) {
                     task.title = titlecontrol.text;
                     task.decraption = descontrol.text;
                     task.time = tasktime.microsecondsSinceEpoch;
                     Provider.of<Listprovider>(context, listen: false)
                         .edittaskprovider(task);
                     Navigator.pop(context);
                     print(DateTime.fromMicrosecondsSinceEpoch(task.time));
                     print(task.title);
                   }
                    },
                 child: Text(AppLocalizations.of(context)!.edittask))
           ],
         ),
       ),
     )
    );
  }

  void selctdate()async{
   final intdate=await showDatePicker(context: context, initialDate:widget.provider.seledtedDate
    , firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
   if (intdate != null) {
     tasktime=intdate;
     setState(() {
     });
  }
  
  }
}
