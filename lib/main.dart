// Change Notifier Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/future_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        // useMaterial3: true,
      ),
      home: const MyHomePage(),
      //home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flutter Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                child: Consumer<MyModel>(
                  builder: (context, MyModel, child) {
                    return Text(
                      "${MyModel.someValue}",
                      style: const TextStyle(
                          fontSize: 27, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              Container(
                child: Consumer<MyModel>(
                  builder: (context, MyModel, child) {
                    return ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.teal)),
                        onPressed: () {
                          MyModel.doSomething();
                        },
                        child: const Text(
                          "CHANGE VALUE",
                          style: TextStyle(color: Colors.white),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  int someValue = 0;
  void doSomething() {
    someValue++;
    notifyListeners();
    print(someValue);
  }
}
