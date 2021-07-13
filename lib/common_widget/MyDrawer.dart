import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatefulWidget{
  
  _myLeftDrawer createState()=>_myLeftDrawer();
}

class _myLeftDrawer extends State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(child:ListView(children: [

//Divider(height: 2,color: Colors.blue,thickness: 2,),
      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Invite Person",style: GoogleFonts.monda(fontSize: 23,color: Colors.black,fontWeight: FontWeight.normal),)),


      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Share Link",style: GoogleFonts.monda(fontSize: 23,color: Colors.black,fontWeight: FontWeight.normal),)),

     // Container(width:double.infinity,height: 20,margin: EdgeInsets.only(top: 20),),

      //Divider(height: 2,color: Colors.cyanAccent,thickness: 3,),
      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Show Sequence No.",style: GoogleFonts.monda(fontSize: 23,color: Colors.black,fontWeight: FontWeight.normal),)),

      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Lock Quantity",style: GoogleFonts.monda(fontSize: 23,color: Colors.black,fontWeight: FontWeight.normal),)),

      Container(margin: EdgeInsets.only(top: 15),child: Divider(height: 2,color: Colors.black45,),)

    ],),);
  }
  
}