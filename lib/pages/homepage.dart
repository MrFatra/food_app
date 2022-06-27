import 'package:flutter/material.dart';
import 'package:food_app/model/list_food.api.dart';
import 'package:food_app/model/list_food.dart';
import 'package:food_app/pages/detail.dart';
import 'package:food_app/widgets/card.dart';
import 'package:food_app/widgets/category.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // var
  late List<Food> _food;
  late List<Food> _foodRecomendation;
  bool isLoading = true;

  // fun
  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    getFood();
    super.initState();
  }

  Future<void> getFood() async {
    _food = await FoodAPI.getFood();
    _foodRecomendation = await FoodAPI.getFoodRecomendation();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? _buildLoading()
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      width: size.width,
                      height: size.height / 2.2,
                      color: const Color(0xff6495ED),
                      child: SafeArea(
                        minimum: const EdgeInsets.only(left: 15, top: 40),
                        child: Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hello User!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 38,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'What are you craving for today?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const CategoryWidget(
                      category: 'Most Popular', color: Color(0xff68A7AD)),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    height: size.height / 4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _food.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  food: _food[index],
                                ),
                              ),
                            );
                          },
                          child: FoodCard(
                            image: _food[index].images,
                            title: _food[index].name,
                            cookingTime: _food[index].cookingTime,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  const CategoryWidget(
                      category: 'Recommended', color: Color(0xff143F6B)),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    height: size.height / 4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _foodRecomendation.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  food: _foodRecomendation[index],
                                ),
                              ),
                            );
                          },
                          child: FoodCard(
                            image: _foodRecomendation[index].images,
                            title: _foodRecomendation[index].name,
                            cookingTime: _foodRecomendation[index].cookingTime,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
