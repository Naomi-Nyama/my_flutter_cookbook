import 'package:flutter/material.dart';
import 'package:my_flutter_cookbook/appbar/app_bar.dart';
//import 'package:my_flutter_cookbook/objectbox.dart';
import 'objectbox.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

late ObjectBox objectbox;

Future<void> main() async {
  //make sure objectBox has access to apps directory
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

//runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter cookbook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Event Management Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          //autoPlayInterval: Duration(seconds: 3),
          //autoPlayAnimationDuration: Duration(milliseconds: 800),
          // autoPlayCurve: Curves.fastOutSlowIn,
          //enlargeCenterPage: false,
          //enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
