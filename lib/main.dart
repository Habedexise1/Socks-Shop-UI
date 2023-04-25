import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:socks_shop_application_dashboard/ViewStock.dart';

void main(List<String> args) {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.only(left: 25, right: 25, top: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [
                    Color.fromRGBO(255, 250, 182, 1),
                    Color.fromRGBO(255, 239, 78, 1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.menu, color: Colors.black),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Best Online \nStocks Collection',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(97, 90, 90, 1)),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Image.asset('assets/header-socks.png')),
                    ],
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -35),
              child: Container(
                height: 60,
                padding: EdgeInsets.only(left: 20, top: 8),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20.0,
                      offset: Offset(0, 10.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon:
                          Icon(Icons.search, color: Colors.black, size: 20.0),
                      border: InputBorder.none,
                      hintText: 'Search'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Choose \na category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(97, 90, 90, 1)),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.all(10),
                              onPressed: () {},
                              color: Color.fromRGBO(251, 53, 105, 0.1),
                              child: Text(
                                'Adult',
                                style: TextStyle(
                                    color: Color.fromRGBO(251, 53, 105, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.all(10),
                              onPressed: () {},
                              color: Color.fromRGBO(97, 90, 90, 0.1),
                              child: Text(
                                'Adult',
                                style: TextStyle(
                                    color: Color.fromRGBO(97, 90, 90, 0.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 220,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20, left: 20),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  makeCard(
                      context: context,
                      startColor: Color.fromRGBO(251, 121, 155, 1),
                      endColor: Color.fromRGBO(251, 53, 105, 1),
                      image: 'assets/socks-one.png'),
                  SizedBox(
                    width: 50,
                  ),
                  makeCard(
                      context: context,
                      startColor: Color.fromRGBO(203, 251, 255, 1),
                      endColor: Color.fromRGBO(81, 223, 234, 1),
                      image: 'assets/socks-one.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeCard({context, startColor, endColor, image}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(child: ViewStocks(), type: PageTransitionType.fade),
        );
      },
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Container(
          // width: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [startColor, endColor],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(5, 10))
              ]),
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Center(
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
}
