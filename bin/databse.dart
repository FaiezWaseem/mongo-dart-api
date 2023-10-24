import 'package:mongo_dart/mongo_dart.dart';

class Database {
  late Db db;
  Database() {
    this.db = Db('mongodb://127.0.0.1:27017/recapshett');
  }
  get open async {
    await this.db.open();
  }

  get close async {
    await this.db.close();
  }

  DbCollection get StudentsCollection => this.db.collection('students');
}
