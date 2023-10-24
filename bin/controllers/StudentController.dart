import 'package:alfred/alfred.dart';
import 'package:mongo_dart/mongo_dart.dart';

class StudentController {
  late DbCollection db;
  StudentController(DbCollection db) {
    this.db = db;
  }

  getAllstudents(HttpRequest req, HttpResponse res) async {
    return (await this.db.find().toList());
  }

  getAStudent(HttpRequest req, HttpResponse res) async {
    return await this.db.find(where.eq('regno', req.params['regno'])).first;
  }

  createStudent(HttpRequest req, HttpResponse res) async {
    final body = await req.body as Map; //JSON body
    print(body);
    await this.db.insertOne({'regno': body?['regno'], 'name': body?['name']});
    res.json({'status': true, 'message': 'Record Created'});
  }

  updateStudent(HttpRequest req, HttpResponse res) async {
    final body = await req.body as Map; //JSON body
    print(body);
    await this.db.updateOne(
        where.eq('regno', body['regno']), modify.set('name', body['name']));
    res.json({'status': true, 'message': 'Record Updated'});
  }

  deleteStudent(HttpRequest req, HttpResponse res) async {
    final body = await req.body as Map;
    await this.db.deleteOne(where.eq('regno', body['regno']));
    res.json({'status': true, 'message': 'Record Deleted'});
  }
}
