import 'package:bmi/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi/home.dart'; // Import your home page file

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle user sign up
  Future<void> _handleSignUp() async {
    try {
      // Create user in Firebase Authentication
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Store user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': _usernameController.text,
        'email': _emailController.text,
      });

      // Navigate to home page after successful sign up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (error) {
      // Handle sign up errors
      print("Error signing up: $error");
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: SingleChildScrollView(
        child: Container(
            child: Stack(
                children: [
            Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
        padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 53, 51, 51),
              Colors.black],
                begin: Alignment.topLeft, end: Alignment.bottomRight ),
            borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(MediaQuery.of(context).size.width,110))
        ),
            ),

            Container(
            margin:EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
            child: Form(child: Column(children: [
            Text("QUIZ APP \n  SIGNUP",style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 40.0,),
            Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
            height: MediaQuery.of(context).size.height/1.6,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
              SizedBox(height: 20.0,),
              Container(
              padding: EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 160, 160, 147)),
              borderRadius: BorderRadius.circular(10),
              ),
                        child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(15),// Set the border color here
                        ),
                        hintText: 'Enter your username',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-z_+%~-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(15),// Set the border color here
                        ),
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(15),// Set the border color here
                        ),
                        hintText: 'Enter your password',

                      ),
                    ),
                    SizedBox(height: 35.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _handleSignUp(); // Call function to handle sign up
                        }
                      },
                      child: Text('Sign Up', style: TextStyle(color: Colors.black87),),
                    ),
                    SizedBox(height: 10.0), // Add spacing between buttons
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },

                      child: Text('Already have an account? Login', style:
                      TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),


                      ],
                )
              ),
            ),
            )
            ]))))]
        )))])),
      ));
  }
}
