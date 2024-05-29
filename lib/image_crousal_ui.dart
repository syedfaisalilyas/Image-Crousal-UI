import 'package:flutter/material.dart';

class PageViewHeros extends StatefulWidget {
  const PageViewHeros({Key? key}) : super(key: key);

  @override
  _PageViewHerosState createState() => _PageViewHerosState();
}

class _PageViewHerosState extends State<PageViewHeros> {
  final PageController _pageController = PageController(
    viewportFraction: 0.75,
  );

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(cities[currentPage].imageUrl),
                  fit: BoxFit.cover,
                  opacity: 0.45),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: cities[currentPage].gradientColor,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.75,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) => {
                    setState(
                      () {
                        currentPage = value;
                      },
                    )
                  },
                  itemCount: cities.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: index == currentPage ? 15 : 35,
                          top: index == currentPage ? 15 : 35),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.45),
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(23),
                        color: index == currentPage
                            ? Colors.white
                            : Colors.grey.shade300,
                        image: DecorationImage(
                            image: NetworkImage(cities[index].imageUrl),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class City {
  final String name;
  final String imageUrl;
  final List<Color> gradientColor;

  City(this.name, this.imageUrl, this.gradientColor);
}

final List<City> cities = [
  City(
    'Paris',
    'https://images.unsplash.com/photo-1568684333877-4d39f2c871c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    [Color(0xFFF131210).withOpacity(0.25), Color(0xFFF8F430E).withOpacity(0.3)],
  ),
  City(
    'New York',
    'https://images.unsplash.com/photo-1595901688281-9cef114adb0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    [
      Color(0xFFF016FAA).withOpacity(0.25),
      Color(0xFFF925EA2).withOpacity(0.25)
    ],
  ),
  City(
    'Singapore',
    'https://images.unsplash.com/photo-1499359875449-10bbeb21501e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    [
      Color(0xFFFB69EDC).withOpacity(0.25),
      Color(0xFFF3D195C).withOpacity(0.25)
    ],
  ),
  City(
    'Agra',
    'https://images.unsplash.com/photo-1585506942812-e72b29cef752?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1028&q=80',
    [
      Color(0xFFF93ABD1).withOpacity(0.25),
      Color(0xFFF638D7F).withOpacity(0.25)
    ],
  )
];
