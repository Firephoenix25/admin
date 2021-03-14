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
