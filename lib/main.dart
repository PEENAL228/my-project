import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

final ref = FirebaseFirestore.instance.collection('project');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Info());
}

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}
class _InfoState extends State<Info>{

  List project = [];
  List desc = [];
  List link = [];
  List image = [];

  @override
  void initState() {
    //getData();
    Firebase.initializeApp().whenComplete(getData());
    super.initState();
  }
  getData(){
    ref.get().then((QuerySnapshot snapshot){
      snapshot.docs.forEach((DocumentSnapshot doc) {
        project.add(doc['Name']);
        desc.add(doc['Description']);
        link.add(doc['Link']);
        image.add(doc['img']);

      });
    });
    var len = project.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body : new Container(
          child: SingleChildScrollView(
            child: new Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        height: 125,
                        color: Color(0xFF7cc43b),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 55),
                      alignment: AlignmentDirectional.center,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 62,
                          backgroundColor: Color(0xFF1167b1),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/logo.jpg"),
                            radius: 60,
                          ),
                        ),

                      ),
                    )

                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 20,
                    color: Color(0xFFFBFFFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Empowering Agriculture with new techniques",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tenaliRamakrishna(
                                textStyle: TextStyle(fontSize: 30, color: Color(0xFF1167b1), fontWeight: FontWeight.bold,height: 1.0 ,
                                    letterSpacing: 0.2)
                              )

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                          child: Image(image: AssetImage("assets/aboutus.PNG")),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text('KrsIk X is an intelligent,  tech-supported, self-evolving system that delivers farmers and agriculture industry with a better solution for integrating technology in daily operations which helps our partners to manage progress easily.'
                              ' Our partners are centered as to solve their problems in an easy and self-learning way building an eco-system of learning-and -sharing model'
                              ' for a farmer with the mentor. ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF454545),
                                    height: 1.5 ,
                                    letterSpacing: 0.2))
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Text('Better Operation.\nBuilding System.\nSustainable Growth. ',
                              //textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20, color: Color(0xFF1167b1), height: 1.5, letterSpacing: 0.2))
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Business transformation with connection, building system, taking new operation in the existing culture. ',
                              //textAlign: TextAlign.center,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF454545),
                                      height: 1.5 ,
                                      letterSpacing: 0.2))
                          ),
                        ),


                      ],
                    ),
                  ),

                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: Color(0xFFFBFFFA),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                          child: Text("Our Projects",
                              style: GoogleFonts.tenaliRamakrishna(
                                  textStyle: TextStyle(fontSize: 35, color: Color(0xFF7cc43b), fontWeight: FontWeight.bold,height: 1.0 ,
                                      letterSpacing: 0.2)
                              )
                          ),
                        ),
                        //here
                        for(int i=0; i<project.length; i++ ) Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.brown,
                                    child: CircleAvatar(
                                      radius: 47,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(image[i]),
                                        radius: 45,
                                      ),
                                    ),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(project[i],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.tenaliRamakrishna(
                                          textStyle: TextStyle(fontSize: 30, color: Color(0xFF1167b1), fontWeight: FontWeight.bold,height: 1.0 ,
                                              letterSpacing: 0.2)
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Text(desc[i],
                                      //textAlign: TextAlign.center,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF454545),
                                              height: 1.2 ,
                                              letterSpacing: 0.2))
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 15, bottom: 10),
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Download -> ',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('The button is clicked!');
                                          },
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                        )),
                                  ),
                                ),


                              ],

                            ),
                          ),
                        ),



              ],
            ),


          ),
        ),
        ]
      ),
    ),),),);

  }
}

