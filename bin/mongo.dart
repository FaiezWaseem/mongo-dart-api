import 'dart:core';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:alfred/alfred.dart';
import 'controllers/StudentController.dart';

void main(List<String> arguments) async {
  final app = Alfred();

  var db = Db("mongodb://127.0.0.1:27017/recapshett");
  await db.open();
  print("Connected DB");
 
  var Students = db.collection('students');

  var studentController = StudentController(Students);
  
  
  app.get('/', (req, res) => { 'status' : true });
  
  app.get('/api/students', studentController.getAllstudents);
  
  app.get('/api/student/:regno', studentController.getAStudent);

  app.post('/api/student/create', studentController.createStudent);

  app.patch('/api/student/update', studentController.updateStudent);

  app.delete('/api/student/', studentController.deleteStudent);

  await app.listen();
  print('Server is Running on PORT 3000 , http://localhost:3000');

  // app.get('/html', (req, res) {
  //   res.headers.contentType = ContentType.html;
  //   return '<html><body><h1>Test HTML</h1></body></html>';
  // });
  // app.get('/file', (req, res) => File('register.PNG'));
  
  
  // Simple Query
  //  print(await coll.find().toList());
  // await coll.find().forEach((v) => {
  //   print(v),
  //   print('\n\n')
  // });

  // filter
  //  print(await coll.find(where.eq('name' ,'Aadesh Kumar')).toList());
  //  print(await coll.find(where.gt('marks' , 80)).toList());

  // findOne
  // print(await coll.findOne(where.eq("regno", '2012370').fields(['name','_id'])));
  // print(await coll.findOne(where.eq("name", 'Aadesh Kumar').fields(['name','_id'])));


  // insertOne
  // print(await coll.insertOne({'regno': '2012378', 'name': 'Khan Mustafa'}));

  // insertMany
  // print(await coll.insertMany([
  //   {'regno': '2012370', 'name': 'Bill Gates'},
  //   {'regno': '2012371', 'name': 'Imran Khan'},
  // ]));

  // Update
  // var res = coll.updateOne(where.eq('regno', '2012370'), modify.set('name', 'Imran Khan Niazi'));
  //  print(res);

  //Delete
  //  print(await coll.deleteOne({"regno": "2012370"}));


}
