import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  final Widget child;
  final int seconds;
  final Widget navigateAfterSeconds;

  const SplashScreen({
    Key? key,
    required this.child,
    required this.seconds,
    required this.navigateAfterSeconds,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: widget.seconds),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.navigateAfterSeconds),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 13, 13),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Image.asset("images/splash.jpg",
         height: 300,
         ),
         Container(
          margin: EdgeInsets.only(top: 50),
          child: Text("welcome shopping cart",
           style: TextStyle(
            color: Color.fromARGB(255, 163, 38, 0),
            fontSize: 35,
            fontWeight: FontWeight.bold,
           ), 
         ),
         ),
         // SizedBox()
         InkWell(
          onTap: (){
            //pushreplacednamed so it can not goes back to splesh screen 
            Navigator.pushReplacementNamed(context, "/singUp");
          },
           //for animation on container
          child: Ink( 

            padding: EdgeInsets.symmetric(horizontal:80,vertical:16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(255, 43, 0, 163),
            ),
            child:Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
             ),
            
          ),
        
         ),
         ],
          ),
      ),

    );
  }
}