
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mhs_client/common_widget/Validator.dart';
import 'package:mhs_client/common_widget/fire_auth.dart';
import 'package:mhs_client/main.dart';



class MyLogin extends StatefulWidget{
  _MyHomePageState createState()=>_MyHomePageState();
}

class _MyHomePageState extends State<MyLogin> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;


  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {

     /* Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            user: user,
          ),
        ),
      )*/
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      obscureText: false,
      style: style,
      controller: _emailTextController,
      focusNode: _focusEmail,
      validator: (value) => Validator.validateEmail(
        email: value!,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      controller: _passwordTextController,
      focusNode: _focusPassword,
      obscureText: true,
      validator: (value) => Validator.validatePassword(
        password: value!,
      ),
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 200,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {

    _focusEmail.unfocus();
    _focusPassword.unfocus();

    if (_formKey.currentState!
        .validate()) {
      setState(() {
        _isProcessing = true;
      });

      User? user = await FireAuth
          .signInUsingEmailPassword(
        email: _emailTextController.text,
        password:
        _passwordTextController.text, context:context  ,
      );

      setState(() {
        _isProcessing = false;
      });

      if (user != null) {
        Navigator.of(context).pushNamed('/tabbar');
      }


    }




        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final register = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 200,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushNamed('/signup');

        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );




    return

      MaterialApp(home: Scaffold(
      body:

    FutureBuilder(
    future: _initializeFirebase(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    return Center(
        child: SingleChildScrollView(child:Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/onion.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                emailField,
                SizedBox(height: 25.0),
                passwordField,
]),
            ),
                SizedBox(
                  height: 35.0,
                ),
                 _isProcessing
                     ? CircularProgressIndicator():
                 loginButon,
                SizedBox(
                  height: 15.0,
                ),

                 register,
                 SizedBox(
                   height: 15.0,
                 ),
              ],
            ),
          ),
        ),),
      );
    } else if (snapshot.hasError) {
      return Center(child: Text("${snapshot.error}"));
    }
    else{
      return  Container(
        height: 50,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          backgroundColor: Colors.green,
        ),
      );
    }

    }),




    ),);
  }
}