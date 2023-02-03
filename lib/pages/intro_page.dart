import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/pages/home_page.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../utils/color_utils.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("HAY MARKETS",style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                letterSpacing: 0.1,
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 10,),
              const Text("First Online",style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1
              ),),
              const Text("Market",style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,

              ),),
              const SizedBox(height: 10,),
              const Text("Our market always provide fresh items from local farmer's,lets support",style: TextStyle(

              ),),
              SizedBox(height: MediaQuery.of(context).size.height *0.4,
              width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/bg.png"),
              ),
              const Spacer(),
              Column(
                children: [
                  SlideAction(
                    outerColor: kPrimaryColor,
                    sliderButtonIcon: const Icon(FontAwesomeIcons.arrowRight,
                    size: 20,
                      color: kPrimaryColor,
                    ),
                    text: "SWIPE TO START",
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    onSubmit: (){
                      Timer(Duration(milliseconds: 500),()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())));
                    },
                  ),
                  const SizedBox(height: 10,),
                  RichText(text: const TextSpan(
                 children: [
                 TextSpan(
                     text: "HOW TO SUPPORT ",
                     style: TextStyle(
                       fontSize: 13,
                         color: Colors.black54,
                         fontWeight: FontWeight.bold,
                         letterSpacing: 1.2
                     ),
                 ),
                 TextSpan(
                     text: "LOCAL FARMERS",
                     style: TextStyle(
                       fontSize: 13,
                         color: Colors.black54,
                         fontWeight: FontWeight.bold,
                         // letterSpacing: 1.2,
                       decoration: TextDecoration.underline
                     ),
                 ),
                 ]
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
