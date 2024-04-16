import 'package:bmi/databas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Question extends StatefulWidget {


  String category;
  Question({required this.category});


  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {

  bool show=false;


  getontheload()async{
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }



  Stream? QuizStream;
  PageController controller= PageController();


  Widget allQuiz(){
    return StreamBuilder(
        stream:QuizStream,
        builder: (context, AsyncSnapshot snapshot){
          return snapshot.hasData? PageView.builder(
              controller: controller,
              itemCount: snapshot.data.docs.length,
              itemBuilder:(context, index){
                DocumentSnapshot ds= snapshot.data.docs[index];
                return Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white70, Colors.white24], // Add your colors here
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                                child: Text(
                                  ds["question"],
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              //****************************************************


                              SizedBox(height: 20.0,),
                              GestureDetector(
                                onTap: (){
                                  show=true;
                                  setState(() {

                                  });
                                },
                                child:show? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(border: Border.all(color: ds["correct"]==ds["option1"]?
                                  Colors.greenAccent:Colors.redAccent,
                                      width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option1"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ): Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(border: Border.all(color:
                                  Color(0xFF818181),
                                      width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option1"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),






                              //********************************888

                              SizedBox(height: 20.0,),
                              GestureDetector(
                                onTap: (){
                                  show=true;
                                  setState(() {

                                  });
                                },
                                child:show? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(border: Border.all(color: ds["correct"]==ds["option2"]?
                                  Colors.greenAccent:Colors.redAccent,
                                      width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option2"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ): Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(border: Border.all(color:
                                  Color(0xFF818181),
                                      width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option2"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),

                              //***********************************


                              SizedBox(height: 20.0,),
                              GestureDetector(
                                onTap: (){
                                  show=true;
                                  setState(() {

                                  });
                                },
                                child:show? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ds["correct"]==ds["option3"]?
                                      Colors.greenAccent:Colors.redAccent,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option3"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ): Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(border: Border.all(color:
                                  Color(0xFF818181),
                                      width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option3"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),

                              //*******************************************


                              SizedBox(height: 20.0,),
                              GestureDetector(
                                onTap: (){
                                  show=true;
                                  setState(() {

                                  });
                                },
                                child:show? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ds["correct"]==ds["option4"]?
                                      Colors.greenAccent:Colors.redAccent,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option4"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ): Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(border: Border.all(color:
                                  Color(0xFF818181),
                                      width: 2.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    ds["option4"],
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              GestureDetector(
                                  onTap: (){

                                    setState(() {
                                      show=false;
                                    });

                                    controller.nextPage(duration:
                                    Duration(milliseconds: 200), curve: Curves.easeIn);
                                  },
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black),
                                                borderRadius: BorderRadius.circular(6)
                                            ),
                                            child: Icon(Icons.arrow_forward_ios_outlined)),


                                      ]

                                  )
                              ),
                            ]


                        )

                    )

                );


              }):
          Container();


        });


  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(60)),
                        child: Center(
                            child: Icon(Icons.arrow_back_ios, color: Colors.white,))),
                  ),
                  SizedBox(width: 100.0,),
                  Text(
                    widget.category,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 24.0, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(child: allQuiz()),



          ],
        ),
      ),
    );
  }
}