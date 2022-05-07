import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: spaces.length,
        itemBuilder: (context, index) => Hero(
          tag: 'tag${spaces[index].id}',
          child: CardView(
            space: spaces[index],
          ),
        ),
      ),
    );
  }
}

class DestHero extends StatelessWidget {
  CardView cardView;
  DestHero({Key key, this.cardView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destination Hero'),
      ),
      body: Hero(
        tag: 'tag',
        child: cardView,
      ),
    );
  }
}

class CardView extends StatelessWidget {
  Space space;
  CardView({Key key, this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              height: 160,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      space.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 10, top: 20),
                    color: Colors.grey,
                    child: Text(
                      space.description,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 20,
              top: 80,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DestHero(cardView: this),
                    ),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.yellow[800],
                  child: Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
