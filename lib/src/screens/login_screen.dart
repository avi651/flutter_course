import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
     return Container(
       margin: EdgeInsets.all(20.0),
       child: Form(
         key: formKey,
         child: Column(
           children: <Widget>[
             Padding(
               padding: EdgeInsets.only(
                 bottom: 0.0,
               ),
             ),
              emailField(),
             // Container(margin: EdgeInsets.only(top: 25.0),),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0),),
              submitButton(),

           ],
         ),
       ),
     );
  }

  Widget emailField() {
     return TextFormField(
       keyboardType: TextInputType.emailAddress,
       decoration: InputDecoration(
         labelText: 'Email',
         hintText: 'you@example.com',
         labelStyle: new TextStyle(color: Colors.red),
         hintStyle: TextStyle(color: Colors.white),
         focusedBorder: UnderlineInputBorder(
           borderSide: BorderSide(color: Colors.red),
         ),
       ),
       validator: (String value) {
          if (!value.contains('@')){
            return 'Please enter your proper email address';
          }
          return null;
       },

       onSaved: (String value) {
         print(value);
       },

     );
  }



  Widget passwordField() {

    /*return Container(
      margin: EdgeInsets.only(bottom: 50.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Enter Password',
          hintText: 'Password',
          labelStyle: new TextStyle(color: Colors.red),
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ) ,
    );*/

    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Enter Password',
        hintText: 'Password',
        labelStyle: new TextStyle(color: Colors.red),
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),

      validator: (String value) {
        if (value.length < 4) {
          return 'Password must be atleast 4 character';
        }
        return null;
      },

      onSaved: (String value) {
        print(value);
      },

    );

  }

  Widget submitButton() {

    return Container(
      //margin: EdgeInsets.only(left: 50.0),
      width: MediaQuery.of(context).size.width,
      height: 45.0,
      child: RaisedButton(
        color: Colors.red,
        textColor: Colors.white,
        child: new Center(child: new Text('Submit', style: new TextStyle(fontSize: 20.0, color: Colors.white),),), //Text('Submit'),
        onPressed: () {
            //formKey.currentState.validate();
          if(formKey.currentState.validate()) {
            formKey.currentState.save();
            print('The email is $email and password is $password');
          }
        },
      ),
    );

  }

}