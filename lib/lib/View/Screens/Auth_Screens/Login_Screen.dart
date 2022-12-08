import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../View Model/Provider/auth_provider.dart';
import 'Register_Screen.dart';

class  Login_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();

    var _email = TextEditingController();
    var _password = TextEditingController();


    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign in",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
              Text("Welcome Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              TextFormField(
                controller: _email,
                validator: (value) {
                  if(value!.isEmpty || !value.contains("@")){
                    return "Please enter your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  label: Text('Email',style: TextStyle(color: Colors.teal),),
                  prefixIcon: Icon(Icons.email,color: Colors.grey,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),

                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _password,
                validator: (value) {
                  if(value!.isEmpty || value.length < 3){
                    return "Please enter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter Password',
                  label: Text('Password',style: TextStyle(color: Colors.teal)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      Provider.of<Auth_Provider>(context,listen: false).login(email: _email.text, password: _password.text);
                    }
                  },
                  child: Text('Sign in',style: TextStyle(fontSize: 20),),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: TextStyle(color: Colors.red)),
                  TextButton(
                    onPressed: () {
                      Get.to(Register_Screen());
                    },
                    child: Text('Sign Up'),

                  ),
                ],
              ),
              // Sign in with google logo
              SizedBox(height: 40,),
              GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/1.jpg',height:30 ,),
                        SizedBox(width: 10,),
                        Text('Sign in with Google'),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
