import 'dart:ui';

import 'package:burger_app/details.dart';
import 'package:burger_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categoryList = [
    Category(
        'assets/images/tacos.svg', Color(0xffD0E6A5).withAlpha(47), 'Tacos'),
    Category(
        'assets/images/frias.svg', Color(0xff86E3CE).withAlpha(47), 'Frias'),
    Category(
        'assets/images/burger.svg', Color(0xffFFDD95).withAlpha(47), 'Burger'),
    Category(
        'assets/images/pizza.svg', Color(0xffFFACAC).withAlpha(47), 'Pizza'),
    Category('assets/images/burritos.svg', Color(0xffCCAAD9).withAlpha(47),
        'Burritos'),
  ];
  final VoidCallback indexSelection = () {};
  var indexSelectionBar = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: headerView(size),
              flex: 15,
            ),
            Expanded(
              flex: 70,
              child: SingleChildScrollView(
                child: Container(
                  height: size.height * 0.8,
                  child: Column(
                    children: [
                      Container(
                        child: explorarCategories(),
                        height: size.height * 0.2,
                      ),
                      Container(
                        child: productosPopulares(),
                        height: size.height * 0.3,
                      ),
                      Container(
                        child: recomendados(),
                        height: size.height * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: bottomBar((itemSelected) => {
                    setState(() =>
                        {print(itemSelected), indexSelectionBar = itemSelected})
                  }),
              flex: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBar(indexSelection) {
    return Container(
      child: Column(
        children: [
          Spacer(),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 4),
                    color: Colors.grey.withAlpha(50),
                    blurRadius: 5,
                    spreadRadius: 7)
              ],
            ),
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/images/basket.svg',
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffF9F9F9),
                      ),
                    ),
                    onTap: () => {indexSelection(2)},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                              'assets/images/home.svg',
                              color: indexSelectionBar == 0
                                  ? Color(0xff20D0C4)
                                  : Color(0xffBBBBBB),
                            ),
                            onTap: () => {indexSelection(0)},
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                              'assets/images/shop.svg',
                              color: indexSelectionBar == 1
                                  ? Color(0xff20D0C4)
                                  : Color(0xffBBBBBB),
                            ),
                            onTap: () => {indexSelection(1)},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                              'assets/images/favorite.svg',
                              color: indexSelectionBar == 3
                                  ? Color(0xff20D0C4)
                                  : Color(0xffBBBBBB),
                            ),
                            onTap: () => {indexSelection(3)},
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile.jpg',
                                width: 30,
                                height: 30,
                              ),
                            ),
                            onTap: () => {indexSelection(4)},
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget recomendados() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recomendados',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff153E73)),
                )
              ],
            ),
          ),
          Expanded(
            flex: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (itemBuilder, i) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen()),
                    )
                  },
                  child: _recomendadosView(
                      i % 2 == 0, categoryList.elementAt(i).imageName),
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget productosPopulares() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Productos populares',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff153E73)),
              )
            ],
          ),
        ),
        Expanded(
          flex: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (itemBuilder, i) {
              return GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen()),
                  )
                },
                child: _productosView(
                    i % 2 == 0, categoryList.elementAt(i).imageName),
              );
            },
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }

  Widget explorarCategories() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explorar categorias',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff153E73)),
              ),
              Text(
                'Ver todos',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Color(0xffCFCFCF)),
              )
            ],
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (itemBuilder, i) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen()),
                    )
                  },
                  child: _explorarCategorias(
                      categoryList.elementAt(i).imageName,
                      categoryList.elementAt(i).imageBackground,
                      categoryList.elementAt(i).title),
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget headerView(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha(20), spreadRadius: 2, blurRadius: 5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 33,
              width: size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffE2EDF2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xff5117AC),
                ),
                decoration: InputDecoration(
                  helperMaxLines: 1,
                  icon: Icon(
                    Icons.search,
                    size: 15.15,
                    color: Color(0xff5117AC),
                  ),
                  border: InputBorder.none,
                  hintText: 'Buscar',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE2EDF2),
                  ),
                ),
              ),
            ),
            Text(
              'Inicio',
              style: TextStyle(
                color: Color(0xff5117AC),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/favorite.svg',
                  color: Color(0xff20D0C4),
                ),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/images/settings.svg')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _recomendadosView(bool isFavorite, String imageName) {
    var favorite = isFavorite;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha(20),
              blurRadius: 15,
              spreadRadius: 4,
              offset: Offset(4, 10))
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => {
                  setState(() => {
                        favorite = !favorite,
                      })
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    favorite ? Icons.favorite : Icons.favorite_border_rounded,
                    color: favorite ? Color(0xffF02756) : Colors.grey,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  imageName,
                  width: 60,
                  height: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pizza Clásica',
                        style: TextStyle(
                            color: Color(0xff515F65),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Salsa clásica de la casa',
                        maxLines: 2,
                        style: TextStyle(
                            color: Color(0xff515F65),
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '12.58',
                            style: TextStyle(
                                color: Color(0xff515F65),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15.49,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _productosView(bool isFavorite, String imageName) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      width: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha(20),
              blurRadius: 15,
              spreadRadius: 4,
              offset: Offset(4, 10))
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                color: isFavorite ? Color(0xffF02756) : Colors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  imageName,
                  width: 60,
                  height: 60,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pizza Clásica',
                        style: TextStyle(
                            color: Color(0xff515F65),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Salsa clásica de la casa',
                        style: TextStyle(
                            color: Color(0xff515F65),
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '12.58',
                            style: TextStyle(
                                color: Color(0xff515F65),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15.49,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _explorarCategorias(
      String imageName, Color backgroundColor, String title) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              imageName,
              width: 51.3,
              height: 33.96,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xff153E73),
            ),
          )
        ],
      ),
    );
  }
}
