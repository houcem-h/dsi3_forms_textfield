import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Forms TextField Examples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _txt = "No entered text yet";
  String _txtSubmitted = "No submitted text yet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Form',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blue
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width*0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Write your text here:'),
                    TextField(
                      decoration: const InputDecoration(
                          hintText: 'Your text goes here ...'
                      ),
                      // obscureText: true, // for password
                      // keyboardType: TextInputType.datetime, // optimized for dates & times
                      // keyboardType: TextInputType.emailAddress, // optimized for email address
                      // keyboardType: TextInputType.multiline, // optimized for multiline text
                      // keyboardType: TextInputType.number, // optimized for numbers
                      keyboardType: TextInputType.phone, // optimized for phone numbers
                      onChanged: (value) {
                        setState(() {
                          _txt = value;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          _txtSubmitted = value;
                        });
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 40)),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Text(
                            "Text changing in TextField:",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            _txt,
                            style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text(
                            "Submitted Text:",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            _txtSubmitted,
                            style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          boxShadow: [BoxShadow(
                              color: Colors.black,
                              blurRadius: 25,
                              spreadRadius: 5,
                              offset: Offset(0, 15)
                          )]
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
