import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'card/bank_card.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  /// Image List
  List<String>  imageList= [
    'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=4464&q=80',
     'https://images.unsplash.com/photo-1556741533-2c7e140cd038?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2400&q=80',
     'https://images.unsplash.com/photo-1631015157481-99e8b87b4f94?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=4240&q=80',
     'https://images.unsplash.com/photo-1631016800696-5ea8801b3c2a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2384&q=80',
     'https://images.unsplash.com/photo-1626522139680-ed61b221528e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=4240&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: cardSlider(),
        ),
      ),
    );
  }

  /// Card Slider Design
  Widget cardSlider() {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return buildCard(index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 15,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  /// Build Card design
  Widget buildCard(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Material(
                  child: Ink.image(
                    image: NetworkImage(
                      imageList[index]
                    ),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {
                        /// TODO: To navigate to next page
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
