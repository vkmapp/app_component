import 'package:app_component/widgets/expanstion/card_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'card/bank_card.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  /// Image List
  List<String> imageList = [
    'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=4464&q=80',
    'https://images.unsplash.com/photo-1556741533-2c7e140cd038?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2400&q=80',
    'https://images.unsplash.com/photo-1631015157481-99e8b87b4f94?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=4240&q=80',
    'https://images.unsplash.com/photo-1631016800696-5ea8801b3c2a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2384&q=80',
    'https://images.unsplash.com/photo-1626522139680-ed61b221528e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=4240&q=80'
  ];

  /// Visibility
  bool isShow = true;
  double isFade = 1;

  /// Duration
  static const _duration = Duration(seconds: 2);

  late AnimationController expandController;
  late Animation<double> animation;

  bool expand = false;

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(AboutPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                CardService(),
                /* AnimatedOpacity(
                  duration: _duration,
                  opacity: isFade,
                  curve: Curves.bounceIn,
                  child: Visibility(
                    visible: isShow,
                    maintainState: true,
                    maintainAnimation: true,
                    //maintainSize: true,
                    //maintainInteractivity: true,
                    //maintainSemantics: true,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.grey.withOpacity(0.5),
                      child: SizeTransition(
                          axisAlignment: 1.0,
                          sizeFactor: animation,
                          child: Text('asdsad')
                      ),
                    ),
                  ),
                ),*/
                cardSlider(),
                SizedBox(
                  height: 10,
                ),
                detailWidget(),
                SizedBox(
                  height: 10,
                ),
                detailWidget1(),
                SizedBox(
                  height: 10,
                ),
                viewAllWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget viewAllWidget() {
    return Padding(padding: EdgeInsets.all(15.0),
    child: Card(
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(12),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.height),
            Spacer(),
            Text('View all items'),
            Spacer(),
            Icon(Icons.arrow_forward_ios_sharp),
          ],
        ),
      ),
    ),);
  }

  Widget detailWidget() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title Text'),
                          Text(
                            'Value Text',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title Text'),
                        Text(
                          'Value Text',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text('Test')),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailWidget1() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Title Text ajkshd dkhask dkasd sakd aksksakdjh dhkjdhkdhkfdh khfkdhf kdfjkdhfkdhf'),
                    Text(
                      'Value Text',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title Text'),
                          Text(
                            'Value Text',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title Text'),
                        Text(
                          'Value Text',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text('Test')),
            ],
          ),
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
        dragStartBehavior: DragStartBehavior.down,
        itemBuilder: (context, index) {
          return InkWell(child: buildCard(index), onHighlightChanged: (value){
            print(value);
          },);
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
                    image: NetworkImage(imageList[index]),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onHighlightChanged: (value){
                        print(value);
                      },
                      onFocusChange: (value){
                        print('Test $value');
                      },
                      onTap: () {
                        setState(() {
                          isShow = !isShow;
                          expand = !expand;
                        });
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
