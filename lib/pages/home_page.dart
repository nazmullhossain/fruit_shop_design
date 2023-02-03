import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/models/product_models.dart';
import 'package:fruit_shop/utils/color_utils.dart';

import '../widgets/icon_widget.dart';
import '../widgets/products_widgets.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Park Hyung Sik",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Spacer(),
                  iconWidget(FontAwesomeIcons.bagShopping, true)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Get your fresh items \n",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: "with",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: " Hay Markets",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    )),
              ])),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.70,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: boxShadow,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      children: const [
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 25,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Search pineable",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Colors.black38),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 20.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          data[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  index == 0 ? kPrimaryColor : Colors.black45,
                              fontWeight: index == 0
                                  ? FontWeight.bold
                                  : FontWeight.w400),
                        ),
                      );
                    }),
              ),
              GridView.builder(
                shrinkWrap: true,
                  primary: false,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 40),
                  itemCount: data[0].products!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DeatailsPage( product: data[0].products![index],)));
                      },
                      child: ProductWidgets(
                        product: data[0].products![index],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
