import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:html';

/* void main() {
  var numbers = [
    ['2', 'two'],
    ['3', 'three'],
    ['4', 'four'],
    ['1', 'one'],
    ['0', 'zero']
  ];
    list.sort((a, b) => a['id'] > b['id'] ? 1 : 0);
  numbers.sort((a, b) => int.parse(a[0]) > int.parse(b[0]) ? 1 : 0);
  print(numbers);
}
 */

Future<void> addLeads(List<dynamic> list) async {
  int i;
  CollectionReference leads = FirebaseFirestore.instance.collection('Leads');
  DocumentReference id =
      FirebaseFirestore.instance.collection('ID').doc("Leads");
  print(list);
  id.get().then((value) => i = value.get("id"));
  list.forEach((element) {
    element[4] = element[4].replaceAll(" ", "");
    leads.doc(element[4]).get().then((doc) {
      if (doc.exists == false) {
        leads.doc(element[4]).set({
          "id": i,
          "name": element[1],
          "website": element[2],
          "email": element[3],
          "number": element[4],
          "adress": element[5],
          "ads": element[6],
          "niche": element[7],
          "fb": element[8],
          "ig": element[9]
        });
        i++;
        id.update({"id": FieldValue.increment(1)});
      } else {
        print("ahaah");
      }
    }).catchError((error) => print("Failed to add user: $error"));
  });
}

Future<List<Map>> readClosedCall() async {
  List<Map> list = [];

  FirebaseFirestore leads = FirebaseFirestore.instance;

  QuerySnapshot data = await leads.collection('ClosedCall').orderBy('id').get();

  data.docs.forEach((element) => list.add(element.data()));

  return list;
}

Future<List<Map>> readToRecall() async {
  List<Map> list = [];

  FirebaseFirestore leads = FirebaseFirestore.instance;

  QuerySnapshot data = await leads.collection('ToRecall').orderBy('date').get();

  data.docs.forEach((element) => list.add(element.data()));

  return list;
}

Future<List<Map>> readNotAnswered() async {
  List<Map> list = [];

  FirebaseFirestore leads = FirebaseFirestore.instance;

  QuerySnapshot data =
      await leads.collection('NotAnswered').orderBy('id').get();

  data.docs.forEach((element) => list.add(element.data()));

  return list;
}

Future<List<Map>> readRecallMeeting() async {
  List<Map> list = [];

  FirebaseFirestore leads = FirebaseFirestore.instance;

  QuerySnapshot data =
      await leads.collection('RecallMeeting').orderBy('id').get();

  data.docs.forEach((element) => list.add(element.data()));

  return list;
}

Future<List<Map>> readMeeting() async {
  List<Map> list = [];

  FirebaseFirestore leads = FirebaseFirestore.instance;

  QuerySnapshot data = await leads.collection('Meeting').orderBy('id').get();

  data.docs.forEach((element) => list.add(element.data()));

  return list;
}

Future<List<Map>> allLeads() async {
  List<Map> list = [];

  FirebaseFirestore leads = FirebaseFirestore.instance;

  DocumentSnapshot output = await leads.collection('ID').doc('output').get();

  QuerySnapshot data = await leads.collection('ClosedCall').get();
  QuerySnapshot data2 = await leads.collection('NotAnswered').get();
  QuerySnapshot data3 = await leads.collection('ToRecall').get();
  QuerySnapshot data4 = await leads.collection('RecallMeeting').get();
  QuerySnapshot data5 = await leads.collection('Meeting').get();

  data.docs.forEach((element) {
    Map a = element.data();
    a["esito"] = "ClosedCall";

    list.add(a);
  });
  data2.docs.forEach((element) {
    Map a = element.data();
    a["esito"] = "NotAnswered";

    list.add(a);
  });
  data3.docs.forEach((element) {
    Map a = element.data();
    a["esito"] = "ToRecall";

    list.add(a);
  });
  data4.docs.forEach((element) {
    Map a = element.data();
    a["esito"] = "RecallMeeting";

    list.add(a);
  });
  data5.docs.forEach((element) {
    Map a = element.data();
    a["esito"] = "Meeting";

    list.add(a);
  });

  list.sort((a, b) => a['id'] > b['id'] ? 1 : -1);
  list.removeWhere((element) => element['id'] < output.data()['id']);

  return list;
}
