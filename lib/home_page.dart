import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final formkey = GlobalKey<FormState>();

  String name = "";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Here to Get\nWelcomed !',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter your name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Enter Correct name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter your phone number',
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value)) {
                          return "Enter Correct number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'[\w-\.]+@([\w-]+\.)+[\w-]{2,5}')
                                .hasMatch(value)) {
                          return "Enter Correct email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    NeumorphicButton(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 30),
                      style: const NeumorphicStyle(
                          shadowLightColor: Colors.grey,
                          color: Colors.blue,
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.circle()),
                      onPressed: (() {
                        if (formkey.currentState!.validate()) {
                          final snackbar = const SnackBar(content: Text('Submitted'));
                        }
                      }),
                      child:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
