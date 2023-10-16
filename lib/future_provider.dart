// // Future Provider

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'main.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider(
//         initialData: MyModel(Username: "User"),
//         create: (BuildContext context) => GetModel(),
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Future Provider'),
//             centerTitle: true,
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   child: Consumer<MyModel>(
//                     builder: (context, MyModel, child) {
//                       return Text("${MyModel.Username}");
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   child: Consumer<MyModel>(
//                     builder: (context, MyModel, child) {
//                       return ElevatedButton(
//                           style: const ButtonStyle(
//                               backgroundColor:
//                                   MaterialStatePropertyAll(Colors.teal)),
//                           onPressed: () {
//                             MyModel.doSomething();
//                           },
//                           child: const Text(
//                             "CHANGE VALUE",
//                             style: TextStyle(color: Colors.white),
//                           ));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// Future<MyModel> GetModel() async {
//   await Future.delayed(Duration(seconds: 3));
//   return MyModel(Username: 'User');
// }

// class MyModel {
//   String Username;

//   MyModel({required this.Username});

//   Future<void> doSomething() async {
//     await Future.delayed(Duration(seconds: 2));
//     Username = 'Royal';

//     print(Username);
//   }
// }
// Future Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>(
      initialData: MyModel(Username: 'User'),
      create: (BuildContext context) => GetModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Consumer<MyModel>(
                  builder: (context, MyModel, child) {
                    return Text('${MyModel.Username}', style: TextStyle(fontWeight: FontWeight.bold),);
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(child: Consumer<MyModel>(
                builder: (context, MyModel, child) {
                  return ElevatedButton(
                      onPressed: () => MyModel.doSomething(),
                      child: const Text('CHANGE VALUE'));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<MyModel> GetModel() async {
  Future.delayed(const Duration(seconds: 3));
  return MyModel(Username: 'User');
}

class MyModel {
  String Username;

  MyModel({required this.Username});

  Future<void> doSomething() async {
    await Future.delayed(const Duration(seconds: 4));

    Username = 'Royal';

    print(Username);
  }
}
