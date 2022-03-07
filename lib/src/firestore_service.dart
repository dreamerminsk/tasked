import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/anime.dart';
//import 'package:kbapp/src/kb/model.dart';
//import 'package:kbapp/src/utils/formatters.dart';

final CollectionReference animeCollection =
Firestore.instance.collection('anime');

class FirestoreService {
  static final FirestoreService _instance = new FirestoreService.internal();

  factory FirestoreService() => _instance;

  FirestoreService.internal();

  Future<Anime?> createAnime(Anime anime) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(animeCollection.document());

      anime.id = ds.documentID;
      final Map<String, dynamic> data = anime.toJson();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Anime.fromJson(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Future<Anime?> getAnimeByTitle(String title) async {
    return animeCollection
        .where('title', isEqualTo: title)
        .getDocuments()
        .then((mapData) {
      if (mapData.documents.length > 0) {
        return Anime.fromJson(mapData.documents[0].data);
      }
      return null;
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Future<dynamic> updateAnime(Anime anime) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
      await tx.get(animeCollection.document(anime.id));

      await tx.update(ds.reference, anime.toJson());
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

  Future<dynamic> deleteAnime(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(animeCollection.document(id));

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

  Stream<QuerySnapshot> getAnimeList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = animeCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

}
