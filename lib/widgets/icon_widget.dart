
import 'package:flutter/material.dart';
import 'package:fruit_shop/utils/color_utils.dart';


final boxShadow=[
  BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 1,
    spreadRadius: 1,
    offset: const Offset(1,1)
  )
];


Widget iconWidget(IconData icon,bool doExists){
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: boxShadow,
      shape: BoxShape.circle

    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(icon),
        if(doExists)
          Positioned(
              right: 12,
              top:15,
              child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle
            ),
          ))
      ],
    ),
  );
}

Widget priceWidget(String price){
  return RichText(text: TextSpan(
    children: [
      TextSpan(text: "$price",style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )),
      TextSpan(text: "/kg",style: const TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.bold,
      )),
    ]
  ));
}