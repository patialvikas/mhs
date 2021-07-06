

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatefulWidget{
  _MyScreen createState()=>_MyScreen();
}
 class _MyScreen extends State<TabBarDemo> {

   int _itemCount = 0;
   @override
   Widget build(BuildContext context) {


     // TODO: implement build
     return MaterialApp(
       home: DefaultTabController(
         length: 2,
         child: Scaffold(
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
               size: 30,),),
             actions: <Widget>[
               IconButton(
                 icon: Icon(
                   Icons.add,
                   size: 30,
                   color: Colors.black,
                 ),
                 onPressed: () {
                   // do something
                 },
               )
             ],


           ),
           bottomNavigationBar: Container(
             decoration: BoxDecoration(color: Colors.white,
                 border: Border.all(width: 1.0, color: Colors.black26)),
             //Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
             height: 80, child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Row(children: [ Icon(Icons.new_releases_outlined),
                 Text("  Total:", style: TextStyle(color: Colors.black45),),

               ],),
               Text("Rm 5290", style: TextStyle(
                   color: Colors.black, fontWeight: FontWeight.bold),),
               Container(width: 130,
                 height: 45,

                 child: TextButton(

                     child: Text(
                         "Buy",
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



                     Row(

                       children: [
                       Expanded(flex:8,child: Text("Black Grapes",style:
                       TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.bold),),),
                 Flexible(child: Icon(Icons.more_vert,
                   color: Colors.black26,))
                     ],),
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