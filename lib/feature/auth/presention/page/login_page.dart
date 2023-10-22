// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, annotate_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/core/colors/colors.dart';
import 'package:pharmcy_app/feature/auth/presention/get_x/auth_controller.dart';

class Register extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthController controller = Get.find();
  late MyColors colors = MyColors();
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            const Center(
              child: Image(
                image: AssetImage('assests/image/pharmacy.png'),
                height: 234,
                width: 234,
              ),
            ),
            SizedBox(
              height: size.height * 0.009,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 140, top: 20),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                'Sign',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colors.textcolors,
                                    fontSize: 40),
                              ),
                            ),
                            const Center(
                              child: Text(
                                'in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: size.height * 0.07),
                              child: const Text(
                                'sing in',
                                style: TextStyle(
                                    textBaseline: TextBaseline.ideographic,
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(70),
                                      borderSide: const BorderSide(
                                          color: Colors.black45),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: colors.textcolors,
                                      ),
                                      //<-- SEE HERE
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: colors.textcolors,
                                    ),
                                    hintText: 'emailaddress'),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextFormField(
                                controller: password,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(70),
                                      borderSide: const BorderSide(
                                          color: Colors.black45),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: colors.textcolors,
                                      ),
                                      //<-- SEE HERE
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: colors.textcolors,
                                    ),
                                    hintText: 'Password'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 50),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.login(email.text.toString(),
                                          password.text.toString());
                                    },
                                    minWidth: size.width * 0.3,
                                    color:
                                        const Color.fromARGB(96, 255, 255, 255),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: colors.textcolors,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'forget password :(',
                                      style: TextStyle(
                                          color: colors.textcolors,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
