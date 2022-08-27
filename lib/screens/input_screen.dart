import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/style.dart';

class InputScreen extends StatelessWidget {

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
        actions: [
          FlatButton(onPressed: (){

            ref.add({
              'title' : title.text,
              'description' : description.text,


            }).whenComplete(() => Navigator.pop(context));
          }, child: Text("Save",
          style: TextStyle(

            color: Colors.blue.shade200,
            fontSize: 20,
            fontWeight: FontWeight.bold,

          ),))
        ],
        
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10) ,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10),
                boxShadow:[
                  BoxShadow(color: Colors.lightBlueAccent, spreadRadius: 3)
                ] ,
                border: Border.all()
              ),
              child: TextField(

                controller: title,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.black),
                ),

              ),

            ),

            SizedBox(

        height: 20,
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    boxShadow:[
                    BoxShadow(color: Colors.lightBlueAccent, spreadRadius: 3)
                ] ,
                ),
                child: TextField(
                  controller: description,
                  maxLines: null,

                  expands: true,
                  decoration: InputDecoration(

                      hintText: "Description",
                      hintStyle: TextStyle(color: Colors.black),


                  ),

                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
