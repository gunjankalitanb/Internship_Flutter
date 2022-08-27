import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/edit_screen.dart';
import 'package:notes/utils/routes.dart';
import 'package:notes/utils/style.dart';

class HomeScreen extends StatelessWidget {

 final ref = FirebaseFirestore.instance.collection('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: AppStyle.mainColor,
      appBar: AppBar(title: Text("Notes",
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.headline4,
          color: Colors.yellow,
          fontSize: 30.0,
          fontWeight: FontWeight.w900,

        ),

      ),

      elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,

      ),


      floatingActionButton:FloatingActionButton(child: Icon(Icons.add),
        onPressed: (){
        Navigator.pushNamed(context, MyRoutes.inputRoute);

      },) ,


      body: StreamBuilder(

        stream: ref.snapshots(),

        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
              itemBuilder: (_,index) {


            return GestureDetector(

              onTap: (){
                
              Navigator.push(context, MaterialPageRoute(builder: (_)=>EditScreen(docToEdit: snapshot.data!.docs[index], )));
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.cyanAccent.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow,
                      spreadRadius: 2,
                      blurRadius: 4,

                    ),
                  ],

                ),

                margin: EdgeInsets.all(10),
                height: 120,
                // color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Text(snapshot.data?.docs[index].get('title'),
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(snapshot.data?.docs[index].get('description'),
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,


                      ),
                    ),

                  ],
                ),
              ),
            );
              });
        }
      ),


    );
  }
}
