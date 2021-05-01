import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covicare/models/supply.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference supplyCollection =
      FirebaseFirestore.instance.collection('supply');

  Future updateUserData(String userid, String name, String email) async {
    print("entered");
    return await userCollection.doc(uid).set({
      'uid': userid,
      'name': name,
      'email': email,
    });
  }

  Future updateSupplyData(Supply supplyData) async {
    return await supplyCollection.doc(uid).set({
      'supplyname': supplyData.name,
      'phone': supplyData.phone,
      'country': supplyData.country,
      'state': supplyData.state,
      'city': supplyData.city,
      'pincode': supplyData.pincode,
      'address1': supplyData.address1,
      'address2': supplyData.address2,
      'landmark': supplyData.landmark,
      'oxygen': supplyData.oxygen,
      'bed': supplyData.bed,
      'rem': supplyData.rem,
      'fav': supplyData.rem,
      'oxyamt': supplyData.oxyAmt,
      'oxyqnt': supplyData.oxyQnt,
      'bedamt': supplyData.bedAmt,
      'bedqnt': supplyData.bedQnt,
      'remamt': supplyData.remAmt,
      'remqnt': supplyData.remQnt,
      'favamt': supplyData.favAmt,
      'favqnt': supplyData.favQnt,
    });
  }
  // brew list from a snapshot

  // List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Brew(
  //       name: doc.data['name'] ?? 'no name',
  //       strength: doc.data['strength'] ?? 0,
  //       sugars: doc.data['sugars'] ?? '0',
  //     );
  //   }).toList();
  // }

  // user data from snapshots

  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     name: snapshot.data['name'],
  //     sugars: snapshot.data['sugars'],
  //     strength: snapshot.data['strength'],
  //   );
  // }

  // get brews streams
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots().map(_brewListFromSnapshot);
  // }

  // get user doc stream

  // Stream<UserData> get userData {
  //   return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  // }
}
