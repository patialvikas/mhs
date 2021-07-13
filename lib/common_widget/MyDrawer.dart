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

      createDrawerHeader(),

//Divider(height: 2,color: Colors.blue,thickness: 2,),
      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Invite Person",style: GoogleFonts.monda(fontSize: 20,color: Colors.black,fontWeight: FontWeight.normal),)),


      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Share Link",style: GoogleFonts.monda(fontSize: 20,color: Colors.black,fontWeight: FontWeight.normal),)),

     // Container(width:double.infinity,height: 20,margin: EdgeInsets.only(top: 20),),

      //Divider(height: 2,color: Colors.cyanAccent,thickness: 3,),
      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Show Sequence No.",style: GoogleFonts.monda(fontSize: 20,color: Colors.black,fontWeight: FontWeight.normal),)),

      Container(margin:EdgeInsets.only(left: 30,top: 15),child:
      Text("Lock Quantity",style: GoogleFonts.monda(fontSize: 20,color: Colors.black,fontWeight: FontWeight.normal),)),

     // Container(margin: EdgeInsets.only(top: 15),child: Divider(height: 2,color: Colors.black45,),)

    ],),);
  }




  Widget createDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Stack(
          children: [
            Positioned(top:0,left:10,child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  border: Border.all(color: Colors.redAccent),
                image: DecorationImage(
                    image: AssetImage('assets/images/onion.jpg'),
                    fit: BoxFit.fill
                ),
              ),
            ),),
    //These can go here or below the header with the same background color
    Positioned(top: 100,
      child:Text("user name",style: TextStyle(color: Colors.black),),),//customize this text
    Positioned(top:115,child:Text("useremail@example.com",style: TextStyle(color: Colors.black),),),
    //...additional header items here
    ],
    ));
  }
  
}