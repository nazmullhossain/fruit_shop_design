import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/utils/color_utils.dart';
import 'package:fruit_shop/widgets/icon_widget.dart';

import '../models/product_models.dart';

class ProductWidgets extends StatelessWidget {
  final Product product;
  const ProductWidgets({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05 * pi,
              child: Image.asset(
                product.image,
                height: 80,
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: boxShadow
                ),
                child: Icon(FontAwesomeIcons.solidHeart,
                size: 15,),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              // top: 0,
              left: 0,
              child: Container(
            height: 70,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: product.color.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(0,1)
                    )
                  ]
                  
                ),
                child: Column(
                  children: [
                    Text(product.name,
                    style: const TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 16),),
                    const SizedBox(height: 5,),
                    priceWidget(product.price),
                    const SizedBox(height: 10,),
                    // Row(
                    //   children: const [
                    //     Text("See More"),
                    //     SizedBox(width: 10,),
                    //     Icon(FontAwesomeIcons.arrowTrendUp,
                    //     color: kPrimaryColor,
                    //     size: 16,)
                    //   ],
                    // )

                  ],
                ),
          )
          )
        ],
      ),
    );
  }
}
