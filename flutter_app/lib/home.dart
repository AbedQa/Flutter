import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(92, 160, 211, 1),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
             //title
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  'Hello, what do you\nwant to watch ?',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),

               Spacer(),
              //search
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.white.withAlpha(30),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
              ),

              Spacer(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                width: double.infinity,
                height: 500,
                color: Colors.white,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "RECOMMENDED FOR YOU",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(color: Colors.white.withAlpha(90)),
                        ),
                      ],
                    ),
                    ListView(
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      children: [
                        CardView(
                          imageName: "1.png",
                        ),
                        CardView(
                          imageName: "2.png",
                        ),
                        CardView(
                          imageName: "3.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2,),
            ],
          ),
        )
    );
  }
}


class CardView extends StatelessWidget {
  final String imageName;

  const CardView({Key key, this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("assets/images/$imageName"),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Avengers: Endgame',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
