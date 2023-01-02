class Task{
  String id;
  String title;
  String decraption;
  int time;
  bool isdone=false;
  Task({required this.title,this.id='',required this.time,required this.decraption,required this.isdone});

  Task.fromJson(Map<String,dynamic> json):this(
    title: json['title'] as String,
    decraption:  json['decraption'] as String,
    isdone: json['isdone'] as bool ,
    time: json['time'] as int ,
    id:  json['id'] as String
  );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'id': id,
      'decraption': decraption,
      'time': time,
      'isdone': isdone,

    };
  }

}