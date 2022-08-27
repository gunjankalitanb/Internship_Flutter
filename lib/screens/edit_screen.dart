import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';
class EditScreen extends StatefulWidget {

 late DocumentSnapshot docToEdit;
 EditScreen({required this.docToEdit});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docToEdit.get('title') ?? ' ');
    description = TextEditingController(text: widget.docToEdit.get('description') ?? ' ');
    super.initState();
  }

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

            widget.docToEdit.reference.update({
                'title' : title.text,
                'description' : description.text,


              }).whenComplete(() => Navigator.pop(context));
            
            // ref.add({
            //   'title' : title.text,
            //   'description' : description.text,
            //
            //
            // }).whenComplete(() => Navigator.pop(context));
          }, child: Text("Save",
            style: TextStyle(

              color: Colors.blue.shade200,
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),)),

          FlatButton(onPressed: (){

            widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));

            // ref.add({
            //   'title' : title.text,
            //   'description' : description.text,
            //
            //
            // }).whenComplete(() => Navigator.pop(context));
          },

              child: Icon(Icons.delete,
              color: Colors.blue.shade200),

          //     Text(
          //
          //   "Delete",
          //   style: TextStyle(
          //
          //     color: Colors.blue.shade200,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //
          //   ),
          //
          // ),

          )

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
                    hintText: "Title"
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

                    boxShadow:[
                      BoxShadow(color: Colors.lightBlueAccent, spreadRadius: 3)
                    ] ,

                    border: Border.all()
                ),
                child: TextField(
                  controller: description,
                  maxLines: null,

                  expands: true,
                  decoration: InputDecoration(
                      hintText: "Description"
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

