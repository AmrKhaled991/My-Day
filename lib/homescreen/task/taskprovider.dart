
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/homescreen/firebase/firebas_useing.dart';
import 'package:todo_app/homescreen/firebase/firebasetask.dart';

class  Listprovider extends ChangeNotifier {
  DateTime seledtedDate = DateTime.now();
  List<Task>listtasks = [];

  getdatafromfirebase() async {
    QuerySnapshot<Task>querySnapshot = await gettaskcollection().get();
    listtasks = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    listtasks = listtasks.where((task) {
      DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(task.time);
      if (dateTime.year == seledtedDate.year &&
          dateTime.month == seledtedDate.month &&
          dateTime.day == seledtedDate.day) {
        return true;
      } else {
        return false;
      }

    }).toList();

    listtasks.sort((Task task1, Task task2) {
      DateTime dateTime1 = DateTime.fromMicrosecondsSinceEpoch(task1.time);
      DateTime dateTime2 = DateTime.fromMicrosecondsSinceEpoch(task1.time);
      return dateTime1.compareTo(dateTime2);
    });
    notifyListeners();
  }
  delettask(task){
    deletfromdirebase(task).timeout(Duration(microseconds: 500),onTimeout: () {
      print('deleted');
    },);
    notifyListeners();
  }
  edittaskprovider(task){
    deletfromdirebase(task);
    notifyListeners();
  }

  String languge = 'ar';
  ThemeMode apptheme = ThemeMode.light;

  void changlanguge(String x)async {
    if (languge == x) {
      return;
    } else {
      languge = x;

    }
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('lang',languge);
    notifyListeners();
  }
    void changtheme(ThemeMode mode) async{
      if (apptheme == mode) {
        return;
      } else {
        apptheme = mode;
      }
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('theme',apptheme==ThemeMode.light?'light':'dark');
      notifyListeners();
    }
    bool darkmode() {
      return apptheme == ThemeMode.dark;
    }
    taskisdone(Task task){
      donefromdirebase(task);
      notifyListeners();
    }
  }
