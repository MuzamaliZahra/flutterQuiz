import 'package:bmi/databas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {


  uploadItem()async{
    if(
    questioncontroller.text!=null &&
        option1controller.text!="" &&
        option2controller.text!=""  &&
        option3controller.text!=""  &&
        option4controller.text!="" ){
      String addId= randomAlphaNumeric(10);



      Map<String, dynamic> addQuiz={

        "option1": option1controller.text,
        "option2": option2controller.text,
        "option3": option3controller.text,
        "option4": option4controller.text,
        "correct": correctcontroller.text,
        "question": questioncontroller.text,

      };

      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent
            ,
            content: Text(
              "Quiz has been added successfully",
              style: TextStyle(fontSize: 18.0,),) ));

      });
    }
  }


  String? value;
  final List<String> quizitems =['JAVA', 'OTHER', 'C++', 'JS', 'PHP','HTML'];


  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController correctcontroller = new TextEditingController();
  TextEditingController questioncontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Quiz",
          style: TextStyle(color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
      body:  SingleChildScrollView(


        child: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white70, Colors.black12], // Add your colors here
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            ),
          ),

          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Quiz", style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),),


              SizedBox(height: 20.0,),
              Text("Add your Question", style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),),



              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:TextField(
                  controller:questioncontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Question",
                      helperStyle: TextStyle(color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)
                  ),
                ),
              ),
















              SizedBox(height: 20.0,),
              Text("Option 1", style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
                fontWeight:FontWeight.w500,
              ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:TextField(
                  controller:option1controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Option 1",
                      helperStyle: TextStyle(color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)
                  ),
                ),
              ),

              //********************************

              SizedBox(height: 20.0,),
              Text("Option 2", style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
                fontWeight:FontWeight.w500,
              ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:TextField(
                  controller:option2controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Option 2",
                      helperStyle: TextStyle(color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)
                  ),
                ),
              ),


              //**************************************



              SizedBox(height: 20.0,),
              Text("Option 3", style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
                fontWeight:FontWeight.w500,
              ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:TextField(
                  controller:option3controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Option 3",
                      helperStyle: TextStyle(color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)
                  ),
                ),
              ),



              //*********************************************88



              SizedBox(height: 20.0,),
              Text("Option 4", style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
                fontWeight:FontWeight.w500,
              ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:TextField(
                  controller:option4controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Option 4",
                      helperStyle: TextStyle(color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)
                  ),
                ),
              ),



              //***********************************



              SizedBox(height: 20.0,),
              Text(" Correct Answer", style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
                fontWeight:FontWeight.w500,
              ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:TextField(
                  controller:correctcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Correct Answer",
                      helperStyle: TextStyle(color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)
                  ),
                ),
              ),
              SizedBox(height: 40.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal:10.0),
                width:   MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(child:
                DropdownButton<String>(items: quizitems.map((item) =>
                    DropdownMenuItem(value: item, child: Text(item,style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    )))).toList(), onChanged: ((value)=>setState(() {
                  this.value=value;
                })),
                  dropdownColor: Colors.white,
                  hint: Text("Select Cetagory"),
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                  value: value,
                )
                ),
              ),


              SizedBox(height: 30.0,),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(
                  child:Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Add", style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),),),
                    ),
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
