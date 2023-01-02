
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/homescreen/firebase/firebasetask.dart';


CollectionReference<Task> gettaskcollection(){
  return FirebaseFirestore.instance.collection('Task').withConverter<Task>(
      fromFirestore: (snapshot,option)=> Task.fromJson(snapshot.data()!),
      toFirestore: (task,option)=> task.toJson(),);
}
Future<void> addtaskfirestore(Task task){
  var collection=gettaskcollection();
    var docref=collection.doc();
    task.id=docref.id;
   return docref.set(task);
}

Future<void> deletfromdirebase(Task task){
 return gettaskcollection().doc(task.id).delete();
}

Future<void> donefromdirebase(Task task,){
  return gettaskcollection().doc(task.id).update({
    'isdone': !task.isdone,
  });
}


Future<void> editfromdirebase(Task task){
 return gettaskcollection().doc(task.id).update(task.toJson());
}
