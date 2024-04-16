import 'package:bmi/add_quiz.dart';
import 'package:bmi/login.dart';
import 'package:bmi/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0), // Adjust the height as needed
        child: AppBar(
          leading: IconButton(
            icon: Center(child: Icon(Icons.logout)),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ),
      ),
      backgroundColor: Color(0xfffdf3f6),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            ),
          ),
          margin: EdgeInsets.only(bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [



                  Container(
                    height: 220,
                    padding: EdgeInsets.only(left: 20.0, top: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "images/profile.jpeg",
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),


                        SizedBox(width: 20.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            FirebaseAuth.instance.currentUser?.email ?? '',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),
                      ],
                    ),









                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration( gradient: LinearGradient(
                      colors: [Colors.black54, Colors.white70], // Add your colors here
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),

                        borderRadius: BorderRadius.circular(20)) ,
                    margin: EdgeInsets.only(top: 140.0, left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          child: Image.asset("images/quiz.jpeg")),

                        SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Test Your \n Knowledge",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 29.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                            Text(
                              "Guess the \n  Correc Answer",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height:30.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Top Quiz Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> Question(category: "PHP",)));
                    },
                    child: Material(
                      borderRadius:BorderRadius.circular(20),
                      elevation: 5.0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration( gradient: LinearGradient(
                          colors: [Colors.black, Colors.white70], // Add your colors here
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/php.jpeg",
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,),
                              SizedBox(height: 20.0,),
                              Text(
                                "PHP",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),

                    //****************************

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> Question(category: "JAVA",)));
                      },
                      child: Material(
                        borderRadius:BorderRadius.circular(20),
                        elevation: 5.0,
                        child: Container(
                            width: 150,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration( gradient: LinearGradient(
                              colors: [Colors.black, Colors.white70], // Add your colors here
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                                borderRadius:BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/JAVA.jpeg",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text(
                                  "JAVA",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )


                    //*********************




                ],
                ),
              ),









        SizedBox(height: 20.0,),
            Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> Question(category: "HTML",)));
              },
              child: Material(
              borderRadius:BorderRadius.circular(20),
              elevation: 5.0,
              child: Container(
              width: 150,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration( gradient: LinearGradient(
                colors: [Colors.black, Colors.white70], // Add your colors here
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius:BorderRadius.circular(20)),
              child: Column(
              children: [
              Image.asset(
              "images/html.jpeg",
              height: 80,
              width: 80,
              fit: BoxFit.cover,),
              SizedBox(height: 20.0,),
              Text(
              "HTML",
              style: TextStyle(
              color: Colors.black,
              fontSize: 23.0,
              fontWeight: FontWeight.w500,
              ),
              ),
              ],
              )),
              ),
            ),


        //************************************************





        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> Question(category: "JS",)));
          },
          child: Material(
            borderRadius:BorderRadius.circular(20),
            elevation: 5.0,
            child: Container(
                width: 150,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration( gradient: LinearGradient(
                  colors: [Colors.black, Colors.white70], // Add your colors here
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                    borderRadius:BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Image.asset(
                      "images/JAVA_SCRIPT.jpeg",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,),
                    SizedBox(height: 20.0,),
                    Text(
                      "JS",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          ),
        ),

              //********************************8888






            ],
            ),
            ),



        //*****************************************88








              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> Question(category: "C++",)));
                      },
                      child: Material(
                        borderRadius:BorderRadius.circular(20),
                        elevation: 5.0,
                        child: Container(
                            width: 150,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration( gradient: LinearGradient(
                              colors: [Colors.black, Colors.white70], // Add your colors here
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                                borderRadius:BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/c++.jpeg",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text(
                                  "C++",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),


                    //************************************************





                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> Question(category: "OTHER",)));
                      },
                      child: Material(
                        borderRadius:BorderRadius.circular(20),
                        elevation: 5.0,
                        child: Container(
                            width: 150,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration( gradient: LinearGradient(
                              colors: [Colors.black, Colors.white70], // Add your colors here
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                                borderRadius:BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/OTHER.jpeg",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text(
                                  "OTHER",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),

                    //********************************8888






                  ],
                ),
              ),


              SizedBox(height: 20.0),

              // Conditionally display the "Add Quiz" button to only admin
              StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.email == "admin@gmail.com") {
                    return Center(
                      child: AdminExclusiveFAB(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddQuiz()),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(); // Hide the button for non-admins
                  }
                },
              ),





















































            ],
          ),
        ),
      ),
    );
  }

  // Define the AdminExclusiveFAB widget within the _HomeState class
  Widget AdminExclusiveFAB({required VoidCallback onPressed}) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }

}
