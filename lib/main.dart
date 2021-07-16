

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_client/common_widget/MyDrawer.dart';
import 'package:mhs_client/ui/login.dart';
import 'package:mhs_client/ui/regisster.dart';

void main() {
  //runApp(TabBarDemo());
  //runApp(MyLogin());
  runApp(MaterialApp(
   // theme: ThemeData(fontFamily: 'bree'),
    color: Colors.white,
    title: '',
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyLogin(),
      '/tabbar':(context)=>TabBarDemo(),
      '/signup':(context)=>Register(),



      // '/statrept': (context) => StatsticsReport(),
      //'/storelogin': (context) => StoreLogin(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      // '/second': (context) => SecondScreen(),
    },
    //home: MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}

class TabBarDemo extends StatefulWidget{
  _MyScreen createState()=>_MyScreen();
}
 class _MyScreen extends State<TabBarDemo> {


   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   int _itemCount = 0;
   String _value = "";
   String _listvaluedot="";


   @override
   Widget build(BuildContext context) {


     // TODO: implement build
     return MaterialApp(
       home: DefaultTabController(
         length: 2,
         child: Scaffold(
           key: _scaffoldKey,
           appBar: AppBar(
             backgroundColor: Colors.white,
             //brightness: Brightness.dark,
             bottom: TabBar(
               labelColor: Color(0xffff3160),
               indicatorSize: TabBarIndicatorSize.tab,
               indicatorColor: Color(0xffff3160),
               labelPadding: EdgeInsets.only(left: 0, right: 0),

               unselectedLabelColor: Colors.black45,


               tabs: [
                 Container(margin: EdgeInsets.only(bottom: 10),
                   child: Text("Desired Items", style: TextStyle(
                       fontSize: 18, fontWeight: FontWeight.bold),),),
                 Container(margin: EdgeInsets.only(bottom: 10),
                   child: Text("My Cart", style: TextStyle(
                       fontSize: 18, fontWeight: FontWeight.bold)),),
                 // Tab(icon: Icon(Icons.directions_bike)),
               ],
             ),
             title: Center(child: Text('Shop', style: TextStyle(fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Colors.black),),),
             leading: IconButton(icon: Icon(
               Icons.menu, color: Colors.black,
               size: 30,),onPressed: (){
               _scaffoldKey.currentState!.openDrawer();
             }, ),
             actions: <Widget>[


               PopupMenuButton(
                 icon:Icon(
             Icons.add,
             size: 30,
             color: Colors.black,
           ),

                   onSelected: (value) {
                     setState(() {
                       _value = value.toString();
                     });
                   },
                   itemBuilder: (context) => [
                     PopupMenuItem(
                       child: Text("Camera",style: GoogleFonts.monda(color: Colors.black,fontWeight: FontWeight.normal),),
                       value: "Camera",
                     ),
                     PopupMenuItem(
                       child: Text("Gallery Import",style: GoogleFonts.monda(color: Colors.black,fontWeight: FontWeight.normal),),
                       value: "Gallery Import",
                     ),

                     PopupMenuItem(
                       child: Text("Dropbox Import",style: GoogleFonts.monda(color: Colors.black,fontWeight: FontWeight.normal),),
                       value: "Dropbox Import",
                     ),
                     PopupMenuItem(
                       child: Text("Google Drive Import",style: GoogleFonts.monda(color:
                       Colors.black,fontWeight: FontWeight.normal),),
                       value: "Google",
                     )
                   ]
               )
               /*IconButton(
                 icon: Icon(
                   Icons.add,
                   size: 30,
                   color: Colors.black,
                 ),
                 onPressed: () {
                   // do something
                 },
               )*/
             ],


           ),

           drawer: MyDrawer(),
           bottomNavigationBar: Container(
             decoration: BoxDecoration(color: Colors.white,
                 border: Border.all(width: 1.0, color: Colors.black26)),
             //Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
             height: 80, child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Row(children: [

                 //Icon(Icons.info,size: 45,color: Colors.black45,),
                 MaterialButton(
                   elevation: 0.2,
                   shape: CircleBorder(),
                   color: Colors.white70,
                   padding: EdgeInsets.all(8),
                   onPressed: () {},
                   child: Text("i",
                     style:GoogleFonts.oswald(fontWeight:FontWeight.bold,
                         fontSize:25,fontStyle: FontStyle.normal,color: Colors.black),
                 ),),

                 Text("    Total:", style: TextStyle(color: Colors.black87),),

               ],),
               Text("Rm 5290", style: TextStyle(
                   color: Colors.black, fontWeight: FontWeight.bold),),
               Container(width: 130,
                 height: 45,

                 child: TextButton(

                     child: Text(
                         "Rm 291.00",
                         style: TextStyle(fontSize: 14, color: Colors.white)
                     ),
                     style: ButtonStyle(
                         padding: MaterialStateProperty.all<EdgeInsets>(
                             EdgeInsets.all(15)),
                         foregroundColor: MaterialStateProperty.all<Color>(
                             Colors.red),
                         backgroundColor: MaterialStateProperty.all<Color>(
                             Color(0xffff3160)),
                         shape: MaterialStateProperty.all<
                             RoundedRectangleBorder>(
                             RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(25.0),
                                 side: BorderSide(color: Color(0xffff3160))
                             )
                         )
                     ),
                     onPressed: () => null
                 ),),


             ],),),

           body: TabBarView(
             children: [
               Container(
                 color: Colors.white,
                 child: ListView.builder(
                   itemCount: 15,
                   itemBuilder: (BuildContext context, int index) {
                     return MyListItems(index);
                   }
               ),
               ),
               Container(),
               //Icon(Icons.directions_bike),
             ],
           ),
         ),
       ),
     );
   }


   Widget MyListItems(int index) {

     return Container(height: 100,
       margin: EdgeInsets.only(left: 10, right: 10, top: 10),
       child: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(8.0),

           ),
           // color: Colors.white,
           elevation: 0.5,
           child: Row(
             children: [

             SizedBox(child:Image.asset(
               index % 2 == 0
                   ? 'assets/images/catring.jpg'
                   : 'assets/images/tommato.jpg',
               width: 100.0,
               height: 100.0,
               fit: BoxFit.cover,
             ),),

             Expanded(flex:3,child: Padding(padding: EdgeInsets.only(left: 25,top: 10), child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [



                    Expanded(child:  Row(

                       children: [
                       Expanded(flex:8,child: Text("Black Grapes",style:
                       TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.bold),),),
                 Flexible(
                      flex: 2,
                     fit: FlexFit.loose,
                     child:
                 PopupMenuButton(
                     icon:Icon(Icons.more_vert,
                       color: Colors.black26,),

                     onSelected: (value) {
                       setState(() {
                         _listvaluedot = value.toString();
                       });
                     },
                     itemBuilder: (context) => [
                       PopupMenuItem(
                         child: Text("Save Favorite",style: GoogleFonts.monda(color: Colors.black,fontWeight: FontWeight.normal),),
                         value: "Save",
                       ),
                       PopupMenuItem(
                         child: Text("Category",style: GoogleFonts.monda(color: Colors.black,fontWeight: FontWeight.normal),),
                         value: "Category",
                       ),

                       PopupMenuItem(
                         child: Text("Export pdf",style: GoogleFonts.monda(color: Colors.black,fontWeight: FontWeight.normal),),
                         value: "pdf",
                       ),
                       PopupMenuItem(
                         child: Text("Remove",style: GoogleFonts.monda(color: Colors.redAccent,fontWeight: FontWeight.normal),),
                         value: "Remove",
                       )
                     ]
                 )
                /* Icon(Icons.more_vert,
                   color: Colors.black26,)*/


                 )
                     ],),),
                 Text("20 Kg",style:  TextStyle(fontSize:12,color: Colors.black,fontWeight: FontWeight.bold),),
                 Container(
                   margin: EdgeInsets.only(bottom: 6),
                   child:Row(
                   children: <Widget>[
                     _itemCount != 0
                         ?
                    Expanded(flex:1,child:  Container (
                      // borderRadius: BorderRadius.circular(5.0),
                      decoration: new BoxDecoration(
                        color: Color(0xfffee5c7),
                        border: Border.all(color: Color(0xfffee5c7), width: 0.0),
                        borderRadius:
                        new BorderRadius.all(Radius.elliptical(90,45)),
                      ),

                      child:GestureDetector(
                          onTap: () {
                            setState(() {
                              _itemCount--;
                            });

                            //print("Click event on Container");
                          },
                          child: Container(
                           height: 24,
                           //width: 40,
                          // color: const Color(0xfffee5c7),
                           child:  Icon(
                           Icons.remove,
                           color: Color(0xffff8834),
                             size: 17,
                         ),)
                     ),),)
                         : new Container(),
                     //Expanded(child:Padding(padding: EdgeInsets.fromLTRB(8, 2, 0, 2),child:Text(_itemCount.toString()))),
                     Expanded(child:Center(child:Text(_itemCount.toString(),style:  TextStyle(fontSize:12,color: Colors.black,fontWeight: FontWeight.bold),),),),
                     Expanded(flex:1,child:Container (
                       //borderRadius: BorderRadius.circular(5.0),
                       decoration: new BoxDecoration(
                         color: Color(0xfffee5c7),
                         border: Border.all(color: Color(0xfffee5c7), width: 0.0),
                         borderRadius:
                         new BorderRadius.all(Radius.elliptical(90,45)),
                       ),
                       child:GestureDetector(
                         onTap: () {
                           setState(() {
                             _itemCount++;
                           });
                           //print("Click event on Container");
                         },
                         child: Container(
                         height: 24,
                         //width: 40,
                         //color: const Color(0xfffee5c7),
                         child:  Icon(
                           Icons.add,
                           size: 17,
                           color: Color(0xffff8834),
                         ),
                     ),),),),

                    Expanded(flex:5,child: Container(
                      margin: EdgeInsets.only(left: 40,right: 12),
                      child: ClipRRect (
                       borderRadius: BorderRadius.circular(5.0),
                       child: Container(

                           height: 30,
                           //width: 90,
                           color: index%2==0?Color(0xffff8834):Color(0xffff3160),
                           child: Center(child:Text(index%2==0?"Add To Cart":"Move Bottom",
                             style: TextStyle(color:Colors.white,fontSize: 12
                           ),))
                       ),),),),
                     


                   ],
                 ),),

               ],),),),

             // Flexible(fit:FlexFit.loose,child: Container()),



              // I just added one line


           ],)
       ),);
   }


 }