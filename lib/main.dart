import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:form_validator/form_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Future<http.Response> fetchUserEmail() {
  return http.get('https://localhost:3003/api/Customer');
}

class UserEmail {
  final String companyContactEmail;

  UserEmail({this.companyContactEmail});

  factory UserEmail.fromJson(Map<String, dynamic> json) {
    return UserEmail(companyContactEmail: json['company_contact_email']);
  }
}

Future<UserEmail> fetchAlbum() async {
  final response = await http.get('https://localhost:3003/api/Customer');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserEmail.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load User Email');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final formKey = new GlobalKey<FormState>();

void validateAndSave() {
  final form = formKey.currentState;
  if (form.validate()) {
    print('form is valid');
  } else {
    print('form is invalid');
  }
}



// void _makeGetRequest() async {
//   // make GET request
//   String url = 'https://localhost:3003/api/Customer';
//   Response response = await get(url);
//   // sample info available in response
//   int statusCode = response.statusCode;
//   Map<String, String> headers = response.headers;
//   String contentType = headers['content-type'];
//   String json = response.body;
//   // TODO convert json to object...
// }

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      key: formKey,
      obscureText: false,
      validator: (value) => value.isEmpty ? 'This field cannot be empty' : null,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0F3),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: validateAndSave, // define the fucntion that runs on press
          child: Text("Login", textAlign: TextAlign.center)),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white, //changing background color
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "R2.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class FirstRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Open route'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondRoute()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
// @override
// Widget build(BuildContext context) {
//   // This method is rerun every time setState is called, for instance as done
//   // by the _incrementCounter method above.
//   //
//   // The Flutter framework has been optimized to make rerunning build methods
//   // fast, so that you can just rebuild anything that needs updating rather
//   // than having to individually change instances of widgets.
//   return Scaffold(
//     appBar: AppBar(
//       // Here we take the value from the MyHomePage object that was created by
//       // the App.build method, and use it to set our appbar title.
//       title: Text(Widget.title),
//     ),
//     body: Center(
//       // Center is a layout widget. It takes a single child and positions it
//       // in the middle of the parent.
//       child: Column(
//         // Column is also a layout widget. It takes a list of children and
//         // arranges them vertically. By default, it sizes itself to fit its
//         // children horizontally, and tries to be as tall as its parent.
//         //
//         // Invoke "debug painting" (press "p" in the console, choose the
//         // "Toggle Debug Paint" action from the Flutter Inspector in Android
//         // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//         // to see the wireframe for each widget.
//         //
//         // Column has various properties to control how it sizes itself and
//         // how it positions its children. Here we use mainAxisAlignment to
//         // center the children vertically; the main axis here is the vertical
//         // axis because Columns are vertical (the cross axis would be
//         // horizontal).
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'You have pushed the button this many times:',
//           ),
//           Text(
//             '$_counter',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//         ],
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _incrementCounter,
//       tooltip: 'Increment',
//       child: Icon(Icons.add),
//     ), // This trailing comma makes auto-formatting nicer for build methods.
//   );
// }
// }
