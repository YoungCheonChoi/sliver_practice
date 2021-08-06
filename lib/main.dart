import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            Container(
              child: SliverAppBar(
                //네이버 지도 api 사이즈
                expandedHeight: 300,
                pinned: true,
                floating: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                      'https://storage.googleapis.com/sy34-ghost/2019/10/flutter-1024x486-1.png'),
                ),
              ),
            ),

            //sliver list
            // new SliverList(
            //   delegate:
            //       new SliverChildBuilderDelegate((context, index) => new Card(
            //             child: new Container(
            //               padding: EdgeInsets.all(10),
            //               child: new Row(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: <Widget>[
            //                   CircleAvatar(
            //                     backgroundColor: Colors.transparent,
            //                     backgroundImage: new NetworkImage(
            //                         "https://i.pinimg.com/originals/d5/b0/4c/d5b04cc3dcd8c17702549ebc5f1acf1a.png"),
            //                   ),
            //                   SizedBox(width: 10), //divide
            //                   Text("card content")
            //                 ],
            //               ),
            //             ),
            //           )),
            // )

            //sliver grid
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              //칸마다 들어갈 것
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text(
                      'Grid Item ${index + 1}',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
                childCount: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
