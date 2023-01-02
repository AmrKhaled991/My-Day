import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/homescreen/task/cards.dart';
import 'package:todo_app/homescreen/task/taskprovider.dart';

class apptasks extends StatefulWidget {

  @override
  State<apptasks> createState() => _apptasksState();
}

class _apptasksState extends State<apptasks> {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<Listprovider>(context);
        provider.getdatafromfirebase();
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.seledtedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
               provider.seledtedDate=date;
               setState(() {
               });
            },
            leftMargin: 20,
            monthColor:provider.apptheme==ThemeMode.light?  Colors.black:Colors.white,
            dayColor: provider.apptheme==ThemeMode.light? Colors.black:Colors.white,
            activeDayColor:provider.apptheme==ThemeMode.light? Colors.white: Colors.black,
            activeBackgroundDayColor: Theme.of(context).primaryColor,
            dotsColor: provider.apptheme==ThemeMode.light? Colors.white:Colors.black,
            selectableDayPredicate: (date) => true,
            locale: provider.languge,
          ),
          SizedBox(height: 25,)
          ,Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                return appcard(task: provider.listtasks[index]);
                },
             separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: provider.listtasks.length,
            ),
          )
        ],
      ),
    );
  }

}
