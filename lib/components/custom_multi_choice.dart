// import 'package:flutter/material.dart';
//
//
// class CustomMultiChoice extends StatelessWidget {
//    CustomMultiChoice(
//       {Key? key,
//       required this.items,
//      required this.onConfirm,
//       this.id,
//       this.hint,
//         this.selectedItems,
//       this.labelText,this.isSearch})
//       : super(key: key);
//   final List items;
//    List? selectedItems;
//    bool? isSearch;
//   final int? id;
//   final String? labelText;
//   final void Function(List) onConfirm;
//   final String? hint;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Text(
//               labelText ?? '',
//               style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//             decoration: BoxDecoration(
//               color: Colors.indigo.withOpacity(.2),
//               borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(12),
//                   bottomLeft: Radius.circular(12)),
//             ),
//             child: MultiSelectDialogField(
//
//               buttonIcon: (Icon(Icons.arrow_downward_outlined,size: 25,
//                 color: Colors.primaries[3].withOpacity(.35),
//               )),
//               buttonText: const Text(
//                 'select',
//                 style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500),
//               ),
//               dialogHeight: double.maxFinite,
//               title: Text(labelText!),
//               listType: MultiSelectListType.LIST,
//
//               searchHintStyle:
//                   const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
//               searchable:isSearch==null?false:true,
//
//
//               decoration:
//                   BoxDecoration(border: Border.all(style: BorderStyle.none)),
//               items: items.map((e) => MultiSelectItem(e, e)).toList(),
//               initialValue:selectedItems??[] ,
//               onConfirm: onConfirm,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
