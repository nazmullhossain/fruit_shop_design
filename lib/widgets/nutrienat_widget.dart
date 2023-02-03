import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/widgets/icon_widget.dart';

import '../models/product_models.dart';

class NutrainWidget extends StatelessWidget {
  final Product product;
  final int index;

  const NutrainWidget({Key? key,required this.product,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.nutrients[index][0],style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),),
              Text("${product.nutrients[index][1]}/5",style: TextStyle(
                color: product.nutrientsColor,fontWeight: FontWeight.w700
              ),)
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children:
              buildIndicators(product.nutrients[index][0],
                  int.parse(product.nutrients[index][1]))

          )

        ],
      ),
    );
  }
  List <Widget> buildIndicators(String nutrientType, int value){
    List<Widget> list=[];
    for(int i =0; i<5; i++){
      list.add(
          i<value?indicator(true,nutrientType):indicator(false, nutrientType)
      );
    }
    return list;
  }
  Widget indicator(bool isActive,String nutrientType){

    IconData ?icon;
    switch (nutrientType){
      case "Energy":
        icon=FontAwesomeIcons.bolt;
        break;

      case "Freshness":
        icon=FontAwesomeIcons.glassWater;
        break;

      case "Vitamin":
        icon=Icons.rocket_launch_rounded;
        break;


      case "Calories":
        icon=FontAwesomeIcons.fire;
        break;

    }
    return Container(
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 5.0),
      child: Icon(
        icon,color: isActive==true? product.nutrientsColor:Colors.black12,
        size: 16,
      ),
    );
  }
}
