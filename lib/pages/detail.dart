import 'package:flutter/material.dart';
import 'package:food_app/model/list_food.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.food});

  final Food food;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.food.images,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 3,
                left: 5,
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(99, 255, 255, 255),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 3,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(99, 255, 255, 255),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: isFavorite
                        ? const Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Prep Time',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${widget.food.prepTime} min',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 75,
                        height: 2,
                        color: const Color.fromARGB(167, 0, 0, 0),
                      ),
                      Column(
                        children: [
                          const Text(
                            'Cook Time',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${widget.food.cookingTime} min',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.food.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(171, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Instructions : ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.food.instructions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: index == 0 ? 10 : 25),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 14, 190, 173),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'Step ${index + 1}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.food.instructions[index].displayText,
                                ),
                                const Divider(
                                  color: Color.fromARGB(167, 0, 0, 0),
                                  thickness: 6,
                                )
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
