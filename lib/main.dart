import 'package:flutter/material.dart';
import 'Constant.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:LoginPage()
    );
  }
}
class LoginPage extends StatefulWidget {

  @override
   _LoginPageState createState() =>  _LoginPageState();
}
class  _LoginPageState extends State <LoginPage> {
  
  bool _passwordVisible=false;
    Widget buildPhotoProfileRow(){
    return Container(
        
        height:170,
            width:200,
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("images/uh - Copy.PNG"),
        fit: BoxFit.cover),
  ),);
  }
   Widget buildPhoneNumRow(){
    return Padding(
      padding:EdgeInsets.all(8),
      child: TextFormField(
        keyboardType:TextInputType.number ,
        decoration:InputDecoration(prefixIcon: Icon(Icons.phone,color: mainColor,),labelText: 'Phonenumber')),
      );
  }
   Widget buildCityRow(){
    return Padding(
      padding:EdgeInsets.all(8),
      child: TextFormField(
        keyboardType:TextInputType.text ,
        decoration:InputDecoration(prefixIcon: Icon(Icons.home,color: mainColor,),labelText: 'City')),
      );
  }
   Widget buildUserNameRow(){
    return Padding(
      padding:EdgeInsets.all(8),
      child: TextFormField(
        keyboardType:TextInputType.text ,
        decoration:InputDecoration(prefixIcon: Icon(Icons.person,color: mainColor,),labelText: 'User name')),
      );
  }
    Widget buildPasswrdRow(){
    return Padding(
      padding:EdgeInsets.all(8),
      child: TextFormField(
        keyboardType:TextInputType.text ,
       obscureText: !_passwordVisible,
       
        decoration:InputDecoration(// Here is key idea
   suffixIcon: IconButton(
     icon: Icon( // Based on passwordVisible state choose the icon_passwordVisible ?
      _passwordVisible ? Icons.visibility : Icons.visibility_off,
       color:mainColor,
        ), 
        onPressed: () { // Update the state i.e. toogle the state of passwordVisible variable 
        setState(() { _passwordVisible = !_passwordVisible; }); }, ),
        
        labelText: 'Password')),
      );
  }
  Widget buildEmailRow(){
    return Padding(
      padding:EdgeInsets.all(8),
      child: TextFormField(
        keyboardType:TextInputType.emailAddress ,
       
        decoration:InputDecoration(prefixIcon: Icon(Icons.email,color: mainColor,),labelText: 'E-mail')),
      );
  }
   Widget buildLoginButton(){
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
     children:<Widget> [
      Container(
            height:1.4*(MediaQuery.of(context).size.height/20),
            width:5*( MediaQuery.of(context).size.width/10),
            margin:EdgeInsets.only(bottom: 20),
          
            child:Container(
      
                color:mainColor,
                height: 70,
                width: 100,
               child:Center(child: Text("OK!",style:TextStyle(color:Colors.white,letterSpacing: 1.5,fontSize: MediaQuery.of(context).size.height/40,),)),

                
                ),
            
      ),
      
     ],
     );
  }
  Widget _buildLogo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
         Text("LOGIN",
         style: TextStyle(fontSize: MediaQuery.of(context).size.height/25,
         fontWeight: FontWeight.bold,
         color: Colors.white,
          ),
         )
      ],);
  }
    Widget _buildContainer(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        ClipRRect(
        borderRadius:BorderRadius.all(Radius.circular(20),),
        child:Container(
          height:MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.8,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
           child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 buildPhotoProfileRow(),
                buildUserNameRow(),
               buildEmailRow(),
               buildPasswrdRow(),
               buildPhoneNumRow(),
               buildCityRow(),
             buildLoginButton(),
              ],
          ),
          ),
         
       ),
      ],);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xfff2f3f7),
      body: Stack(
        children:<Widget> [
          Container(
            height:MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width,
           // child: Container(
              decoration: BoxDecoration(
                color:mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(70),
                  bottomRight: const Radius.circular(70),
                ),
              ),
           // ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
             _buildLogo(),
             _buildContainer(),
            ],
          ),
        ],
      ),
      )
      );
  }
}