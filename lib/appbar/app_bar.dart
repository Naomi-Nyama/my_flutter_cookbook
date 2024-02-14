import 'package:flutter/material.dart';

class TheAppBar extends StatefulWidget {
  const TheAppBar({super.key});

  @override
  State<TheAppBar> createState() => _TheAppBarState();
}

class _TheAppBarState extends State<TheAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        title: const Text("Why are you weird!!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            const Text("Maybe its because you are a weirdo",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 10,
            ),
            const FittedBox(
              child: FlutterLogo(
                size: 100,
              ),
            ),
            // Expanded(
            // lets the child fit the remainder of the screen in this column
            //   child: FittedBox(
            //     child: FlutterLogo(),
            //   ),
            // )
            //containers
            Center(
                child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.cyan,
              width: 50,
              height: 50,
            )),
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headlineMedium!.fontSize! *
                        1.1 +
                    200.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.1),
              child: Text('Hello World',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white)),
            )
            //Elevated buttons
            
          ])),
    );
  }
}
