//  TextFormField(
// // enabled: isEnabled,
// style: const TextStyle(fontSize: 18,color: Colors.black,decoration: TextDecoration.overline),
// obscureText: isHidden,
// onFieldSubmitted: onFieldSubmitted,
// validator: validator,
// key: key,
// controller: controller,
// onChanged: onChanged,
// // cursorColor: Colors.grey.shade200,
// decoration: InputDecoration(
//
// // filled: true,
// // fillColor: Colors.grey.shade200,
// border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(7) ),),
// // focusedErrorBorder: OutlineInputBorder(
// //     borderRadius: BorderRadius.circular(15.0),
// //     // borderSide: BorderSide(color: Theme.of(context).primaryColor)
// // ),
// // errorBorder: OutlineInputBorder(
// //     borderRadius: BorderRadius.circular(15.0),
// //     // borderSide: BorderSide(color: Theme.of(context).primaryColor)
// // ),
// // enabledBorder: OutlineInputBorder(
// //     borderRadius: BorderRadius.circular(15.0),
// //     // borderSide: BorderSide(color: Theme.of(context).primaryColor)
// // ),
// labelText: labelText,
// // hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 20),
// labelStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),
// hintText: hintText,
//
// // hintText: hintText,
// prefixIcon: (prefix != null)
// ? Icon(prefix, color: Theme.of(context).primaryColor)
// : null,
// suffixIcon: (suffix != null)
// ? InkWell(
// onTap: suffixPressed,
// child: Icon(
// suffix,
// color: Theme.of(context).primaryColor,
// ),
// )
// : null,
// // contentPadding: const EdgeInsets.symmetric(
// //     vertical: 20, horizontal: 1)
//
// ) // border: InputBorder.none,
// )


// Stream<QuerySnapshot<Map<String, dynamic>>> getItems() {
//   return FirebaseFirestore.instance.collection('patients').snapshots();
// }
//
// Future<void> getTodo(List<Todo> items) {
//   print('in refresh');
//   return getTodosRefWithConverters().get().then((documentsSnapshot) {
//     items = documentsSnapshot.docs.map((document) {
//       return document.data();
//     }).toList();
//     setState(() {});
//   });
//   print(items.length);
// }
//
// CollectionReference<Todo> getTodosRefWithConverters() {
//   return FirebaseFirestore.instance
//       .collection('patients')
//       .withConverter<Todo>(
//     fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
//     toFirestore: (todo, _) => todo.toJson(),
//   );
// }
// class Todo {
//   late String name;
//
//   Todo({
//     required this.name,
//   });
//
//   Todo.fromJson(Map<String, dynamic> json) {
//     // Timestamp timestamp = json['dateTime'] as Timestamp;
//     name = json['name']! as String;
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//     };
//   }
// }


// Row(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// CustomButton(
// onTap: () {
// generateChronic();
// setState(() {});
// },
// buttonText: 'New Chronic Disease',
// width: 20,
// borderRadius: 15,
// buttonColor: Colors.indigo,
// ),
// CustomButton(
// onTap: () {
// deleteChronic();
// setState(() {});
// },
// buttonText: 'Delete Chronic Disease',
// width: 20,
// borderRadius: 15,
// buttonColor: Colors.deepOrangeAccent,
// ),
// ],
// ),