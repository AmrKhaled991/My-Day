import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Themeofapp.dart';
import 'package:todo_app/homescreen/firebase/firebas_useing.dart';
import 'package:todo_app/homescreen/task/edittask.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';

import '../firebase/firebasetask.dart';

class appcard extends StatefulWidget {
  @override
  Task task;
  appcard({required this.task});

  @override
  State<appcard> createState() => _appcardState();
}

class _appcardState extends State<appcard> {
  bool achave=false;
  Widget build(BuildContext context) {var provider=Provider.of<Listprovider>(context);

    return Slidable(
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.

        // All actions are defined in the children parameter.
        children:  [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context){
              provider.delettask(widget.task);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15)
            ),
            icon: Icons.delete,
            label: 'Delete',
          ),

        ],
      ),

      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(edittask.reoutname,arguments: widget.task);
        },
        child: Container(padding:EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color:provider.apptheme==ThemeMode.light? Colors.white:apptheme.darkitemcolor)
              ,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(color: widget.task.isdone==true? apptheme.primarylightcolor:apptheme.greencolor,borderRadius: BorderRadius.circular(20)),
              ),
               SizedBox(width: 15,)
               ,Column(
                children: [
                  Text(widget.task.title,style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                      color: widget.task.isdone==true ? apptheme.primarylightcolor:apptheme.greencolor),),
                  SizedBox(height: 3,)
                  ,Text('${widget.task.decraption}',style: TextStyle(color: provider.apptheme==ThemeMode.light?  Colors.black:Colors.white),)
                ],
              ),
              InkWell(
                onTap: (){
               Provider.of<Listprovider>(context,listen: false).taskisdone(widget.task);

                },
                child: widget.task.isdone==false
                    ?Text('done',style:Theme.of(context).primaryTextTheme.headline2!.copyWith(color:apptheme.greencolor) ):
                Container(
                  height: 45,
                  width:  60,
                  decoration: BoxDecoration(color:apptheme.primarydarkcolor,borderRadius: BorderRadius.circular(10))
                  ,child: Icon(Icons.check,size: 40,color: Colors.white),
                )

              ),
            ],
        ),
        ),
      ),
    );
  }

}
class data{
  String title;
  String disc;
  data({required this.title,required this.disc});
}

