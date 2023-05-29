import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {
   ClickableWidget({Key? key,this.text, this.onTap,this.iconData}) : super(key: key);

  String? text;
IconData? iconData;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(.2),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Row(
          children: [
            Text(
              text ?? 'Choose Date',
              style: TextStyle(
                  fontSize: 18,
                  color: text == null ? Colors.grey.shade400 : Colors.black),
            ),
            const Spacer(),
            Icon(
              iconData,
              color: Colors.grey.shade900,
            )
          ],
        ),
      ),
    );
  }
}
