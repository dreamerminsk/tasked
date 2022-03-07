//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/anime.dart';
//import 'package:kbapp/src/kb/model.dart';
//import 'package:kbapp/src/utils/formatters.dart';

final CollectionReference animeCollection =
  FirebaseFirestore.instance.collection('anime');

class FirestoreService {
  static final FirestoreService _instance = new FirestoreService.internal();

  factory FirestoreService() => _instance;

  FirestoreService.internal();

  Future<Anime> createAnime(Anime anime) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(animeCollection.doc());

      anime.id = ds.id;
      final Map<String, dynamic> data = anime.toJson();

      tx.set(ds.reference, data);

      return data;
    };

    return FirebaseFirestore.instance.runTransaction(createTransaction).then((mapData) {
      return Anime.fromJson(mapData);
    }).catchError((error) {
      print('error: $error');
      return anime;
    });
  }

  Future<Anime> getAnimeByTitle(String title) async {
    return animeCollection
        .where('title', isEqualTo: title)
        .docs()
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
      await tx.get(animeCollection.doc(anime.id));

      tx.update(ds.reference, anime.toJson());
      return {'updated': true};
    };

    return FirebaseFirestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> deleteAnime(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(animeCollection.doc(id));

      tx.delete(ds.reference);
      return {'deleted': true};
    };

    return FirebaseFirestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Stream<QuerySnapshot> getAnimeList({int? offset, int? limit}) {
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
