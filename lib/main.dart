import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as syspath;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

import 'src/primitive.dart';
import 'src/point.dart';
import 'src/line.dart';
import 'src/triangle.dart';
import 'src/zigzag.dart';
import 'src/player.dart';
import 'src/game.dart';

late Game game;

void main() async {
  await createTestGame();
  runApp(const MyApp());
}

Future<void> createTestGame() async {
  // create the game
  game = Game(id: '123-456', name: 'PongBright', title: 'A Space Invaders Version of Pong');

  // add player 1 with random primitives
  {
    Player player = Player(id: '1', name: 'r2d2');
    game.addPlayer(player);

    Line line = Line(p1: Point(), p2: Point());
    player.addPrimitive(line);

    Point point = Point();
    player.addPrimitive(point);

    List<Point> points = [Point(), Point(), Point(), Point()];
    ZigZag zigzag = ZigZag(points: points);
    player.addPrimitive(zigzag);

    Triangle triangle = Triangle(p1: Point(), p2: Point(), p3: Point());
    player.addPrimitive(triangle);

    // add random set of primitives
    player.addPrimitive(line);
    player.addPrimitive(line);
    player.addPrimitive(zigzag);
    player.addPrimitive(triangle);
    player.addPrimitive(point);
    player.addPrimitive(point);
  }

  // add player 2 with random primitives
  {
    Player player = Player(id: '2', name: 'c3po');
    game.addPlayer(player);

    List<Point> points = [Point(), Point(), Point(), Point()];
    ZigZag zigzag = ZigZag(points: points);
    player.addPrimitive(zigzag);

    Line line = Line(p1: Point(), p2: Point());
    player.addPrimitive(line);

    // add random set of primitives
    player.addPrimitive(line);
    player.addPrimitive(line);
    player.addPrimitive(zigzag);
  }

  // add player 3 with random primitives
  {
    Player player = Player(id: '3', name: 'r2d2Proton');
    game.addPlayer(player);
    Line line = Line(p1: Point(), p2: Point());
    player.addPrimitive(line);

    Point point = Point();
    player.addPrimitive(point);

    List<Point> points = [Point(), Point(), Point(), Point()];
    ZigZag zigzag = ZigZag(points: points);
    player.addPrimitive(zigzag);

    Triangle triangle = Triangle(p1: Point(), p2: Point(), p3: Point());
    player.addPrimitive(triangle);

    // add random set of primitives
    player.addPrimitive(line);
    player.addPrimitive(line);
    player.addPrimitive(zigzag);
  }

  Directory appDocsDir = await getApplicationDocumentsDirectory();
  String filename = 'gameTest.json';
  String fullPath = syspath.join(appDocsDir.path, filename);
  serializeGame(game, fullPath);
  game = deserializeGame(fullPath);
 }

void serializeGame(Game game, String fullPath) {
  final json = jsonEncode(game.toJson());
  File(fullPath).writeAsStringSync(json);
}

Game deserializeGame(String fullPath) {
  if(File(fullPath).existsSync()) {
    final json = File(fullPath).readAsStringSync();
    return Game.fromJson(jsonDecode(json));
  }

  return Game(id: '', name: '', title: '');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
