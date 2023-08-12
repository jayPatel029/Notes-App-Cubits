import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget note_card(Function() ? onTap, QueryDocumentSnapshot documentSnapshot) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 70,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: Colors.grey[400]),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(documentSnapshot['title'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          SizedBox(height: 2,),
          Text("Tap to see content", style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),)
        ],
      ),
    ),
  );
}
