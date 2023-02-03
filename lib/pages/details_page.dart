import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/models/product_models.dart';
import 'package:fruit_shop/utils/color_utils.dart';
import 'package:fruit_shop/widgets/icon_widget.dart';

import '../widgets/nutrienat_widget.dart';

class DeatailsPage extends StatefulWidget {
  final Product product;
  const DeatailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DeatailsPage> createState() => _DeatailsPageState();
}

class _DeatailsPageState extends State<DeatailsPage> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.0),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
            ),
          ),
          Positioned(
              top: 40,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                  ),
                  const Text(
                    "Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                    child: iconWidget(FontAwesomeIcons.bagShopping, true),
                  ),
                ],
              )),
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.55),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * 0.80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 35),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            priceWidget(widget.product.price)
                          ],
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              quantityIcon(
                                  onTap: () {},
                                  color: kSecondaryColor,
                                  icon: FontAwesomeIcons.minus),
                              Text(
                                itemCount.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              quantityIcon(
                                  onTap: () {},
                                  color: kSecondaryColor,
                                  icon: FontAwesomeIcons.plus),
                            ],
                          ),
                        )
                      ],
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 4,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.6),
                        itemBuilder: (contex, index) {
                          return NutrainWidget(
                            product: data[0].products![index],
                            index: index,
                          );
                        }),
                    Padding(padding: EdgeInsets.all(8.0)
                    ,child: Column(
                        children: [
                          Text("Details",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            
                          ),),
                          SizedBox(height: 10,),
                          Text("Lorem ipsum dolar sit amet , constrution adipsint elidt , ")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget quantityIcon(
    {required VoidCallback onTap,
    required Color color,
    required IconData icon}) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color == kPrimaryColor ? Colors.white : kPrimaryColor,
        size: 20,
      ),
    ),
  );
}
