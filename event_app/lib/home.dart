import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var indexSelection = 0;
  Map<int, String> mapCalender = {
    10: 'Sat',
    11: 'Mon',
    12: 'Tue',
    13: 'Wed',
    14: 'Thu',
    15: 'Fri',
    16: 'Sat'
  };
  Map<String, String> eventList = {
    'Concert': 'assets/images/concert.svg',
    'Sports': 'assets/images/pingpong.svg',
    'Education': 'assets/images/collegegraduation.svg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff102733),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      height: 24.07,
                      width: 24.07,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "UVE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "NTO",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => {},
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: 29,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => {},
                          child: Icon(
                            Icons.grid_view,
                            color: Colors.white,
                            size: 29,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 50, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Abed !',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Let's explore what’s happening nearby",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.fill,
                        height: 46,
                        width: 46,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20, right: 30),
                child: Container(
                  height: 70,
                  child: ListView.builder(
                    itemBuilder: (itemBuilder, i) {
                      return GestureDetector(
                          onTap: () => {
                                setState(
                                  () => {
                                    indexSelection = i,
                                  },
                                )
                              },
                          child: calenderView(
                              mapCalender.values.elementAt(i),
                              mapCalender.keys.elementAt(i),
                              i == indexSelection));
                    },
                    itemCount: mapCalender.keys.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20, right: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Events',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20, right: 30),
                child: Container(
                  height: 120,
                  child: ListView.builder(
                    itemBuilder: (itemBuilder, i) {
                      return eventView(eventList.values.elementAt(i),
                          eventList.keys.elementAt(i));
                    },
                    itemCount: eventList.keys.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20, right: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Events',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 5, right: 30),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                    itemBuilder: (itemBuilder, i) {
                      return popularEvents();
                    },
                    itemCount: eventList.keys.length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget popularEvents() {
    return Container(
      height: 120,
      width: 130,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff29404E),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sports Meet in Galaxy Field',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Jan 12, 2019',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Galaxyfields, Sector 22, Faridabad',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            width: 100,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(bottom: 10),
              child: Image.asset(
                'assets/images/sportimg.png',
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget eventView(String image, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 102,
      width: 130,
      decoration: BoxDecoration(
        color: Color(0xff29404E),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            height: 30,
            width: 30,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '$title',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget calenderView(String day, int number, bool isSelect) {
    return Container(
      height: 60,
      width: 55,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: !isSelect ? Colors.transparent : Color(0xffFCCD00),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: isSelect ? Colors.transparent : Color(0xffFCCD00),
              width: 2,
              style: BorderStyle.solid)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$number',
            style: TextStyle(
              fontSize: 13,
              color: isSelect ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$day",
            style: TextStyle(
              fontSize: 13,
              color: isSelect ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
