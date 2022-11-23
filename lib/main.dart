// @dart = 2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/ui/pages/data_post.dart';
import 'ui/pages/images.dart';
import 'ui/pages/main_page.dart';
import 'ui/wigets/moviebox.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: 'tes');
  PageController controllers =
      PageController(initialPage: 0, viewportFraction: 0.5);
  List<String> urls = [
    'https://static.dw.com/image/61514146_605.jpg',
    'https://static.dw.com/image/61514146_605.jpg',
    'https://static.dw.com/image/61514146_605.jpg'
  ];

  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
      indicator: BoxDecoration(
          color: Color.fromARGB(155, 75, 88, 229),
          border: Border(top: BorderSide(color: Colors.blueGrey, width: 5))),
      tabs: <Widget>[
        SizedBox(
          height: 50,
          child: Tab(
            // icon: Icon(Icons.comment),
            text: "Tab 1",
          ),
        ),
        SizedBox(
          height: 50,
          child: Tab(
            // icon: Icon(Icons.computer),
            text: "Crud Firestore",
          ),
        ),
        SizedBox(
          height: 50,
          child: Tab(
            text: "Tab 3",
          ),
        ),
      ],
    );

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.adb,
              color: Color.fromARGB(255, 5, 61, 191),
            ),
            title: Text(
              'Catalog Furnitur',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 186, 237, 21),
                      Color.fromARGB(255, 228, 118, 15)
                    ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(175, 106, 18, 164),
                            Color.fromARGB(255, 167, 9, 51)
                          ],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight),
                    ),
                    child: myTabBar)),
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            labelText: 'Search',
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: controller,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: PageView.builder(
                          controller: controllers,
                          itemCount: urls.length,
                          itemBuilder: ((context, index) => Container(
                                child: MovieBox(urls[index]),
                              ))),
                    ),
                  ),
                  Flexible(
                      flex: 3,
                      child: ListView(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                title: 'title1',
                                                desc: 'desc1',
                                              )));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: Color.fromARGB(79, 12, 228, 247),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image(
                                            image: CachedNetworkImageProvider(
                                                "https://static.dw.com/image/61514146_605.jpg")),
                                        // Image.network(
                                        // 'https://static.dw.com/image/61514146_605.jpg'),
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text('Title 1'),
                                  ],
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyImage()));
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  padding: EdgeInsets.all(3),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                        image: CachedNetworkImageProvider(
                                            "https://static.dw.com/image/61514146_605.jpg")),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                title: 'title3',
                                                desc: 'desc3',
                                              )));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: Color.fromARGB(79, 12, 228, 247),
                                      child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Image(
                                              image: CachedNetworkImageProvider(
                                                  "https://static.dw.com/image/61514146_605.jpg"))),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text('Title 3'),
                                  ],
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                title: 'title4',
                                                desc: 'desc4',
                                              )));
                                },
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      color: Color.fromARGB(79, 12, 228, 247),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image(
                                            image: CachedNetworkImageProvider(
                                                "https://static.dw.com/image/61514146_605.jpg")),
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text('Title 4'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widgets,
                        )
                      ])),
                ],
              ),
              MyTab2(),
              Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.amber,
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(255, 32, 255, 7),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
