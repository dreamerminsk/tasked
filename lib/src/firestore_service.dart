import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kbapp/src/kb/model.dart';
import 'package:kbapp/src/utils/formatters.dart';

final CollectionReference yearCollection =
Firestore.instance.collection('boxoffice_years');

final CollectionReference thursdayCollection =
Firestore.instance.collection('thursdays');

final CollectionReference weekendCollection =
Firestore.instance.collection('weekends');

final CollectionReference workerCollection =
Firestore.instance.collection('workers');

final CollectionReference personCollection =
Firestore.instance.collection('persons');

class FirestoreService {
  static final FirestoreService _instance = new FirestoreService.internal();

  factory FirestoreService() => _instance;

  FirestoreService.internal();

  Future<Thursday> createThursday(Thursday thursday) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx
          .get(thursdayCollection.document(isoFormatter.format(thursday.date)));

      final Map<String, dynamic> data = thursday.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Thursday.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getThursdayList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots =
    thursdayCollection.orderBy('date', descending: true).snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<Weekend> createWeekend(Weekend weekend) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx
          .get(weekendCollection.document(isoFormatter.format(weekend.date)));

      final Map<String, dynamic> data = weekend.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Weekend.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getWeekendList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots =
    weekendCollection.orderBy('date', descending: true).snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<YearRecord> createYear(YearRecord year) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(yearCollection.document());

      final Map<String, dynamic> data = year.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return YearRecord.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getYearList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = yearCollection.orderBy('pos').snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<Person> createPerson(String fullName, String avatar) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(personCollection.document());

      final Map<String, dynamic> data =
      Person(fullName: fullName, avatar: avatar).toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Person.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Future<Person> getPersonByName(String fullName) async {
    return personCollection
        .where('fullName', isEqualTo: fullName)
        .getDocuments()
        .then((mapData) {
      if (mapData.documents.length > 0) {
        return Person.fromMap(mapData.documents[0].data);
      }
      return null;
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Future<Note> createNote(String title, String description) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(yearCollection.document());

      final Note note = new Note(ds.documentID, title, description);
      final Map<String, dynamic> data = note.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Note.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Future<dynamic> updateNote(YearRecord note) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
      await tx.get(yearCollection.document(note.id));

      await tx.update(ds.reference, note.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> deleteNote(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(yearCollection.document(id));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<Worker> createWorker(String title) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
      await tx.get(workerCollection.document(title));

      final Worker note = new Worker(title, DateTime.now());
      final Map<String, dynamic> data = note.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Worker.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getWorkerList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = workerCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<dynamic> updateWorker(Worker worker) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
      await tx.get(workerCollection.document(worker.id));

      await tx.update(ds.reference, worker.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> deleteWorker(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(workerCollection.document(id));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }
}
