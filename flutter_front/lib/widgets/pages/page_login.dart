import 'package:flutter/material.dart';
import 'package:flutter_front/controllers/controller_login.dart';
import 'package:flutter_front/widgets/atoms/button/atom_login_button.dart';
import 'package:flutter_front/widgets/atoms/card/atom_login_card.dart';
import 'package:flutter_front/widgets/atoms/input/atom_login_input.dart';
import 'package:flutter_front/widgets/atoms/text/atom_login_title.dart';
import 'package:get/get.dart';

class PageLogin extends StatelessWidget {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final LoginController loginController = Get.put(LoginController());

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    double width = MediaQuery.of(context).size.width;
    bool isMobile = shortestSide < 600;

    if (isMobile) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginCard(
                  width: width,
                  cellphone: isMobile,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, bottom: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LoginTitle(),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: LoginInput(
                              controller: emailController,
                              labelText: 'Email',
                              hintText: 'gabriel.fardoski@gmail.com',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: LoginInput(
                              controller: passwordController,
                              hintText: '',
                              labelText: 'Senha',
                              password: true,
                            ),
                          ),
                          GetBuilder<LoginController>(builder: (_) {
                            return _.apiError.length > 0 ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${_.apiError}',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ) : Container();
                          }),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: LoginButton(
                              onTap: () => onLogin(loginController),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginCard(
                  width: 500,
                  cellphone: isMobile,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, bottom: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LoginTitle(),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: LoginInput(
                              controller: emailController,
                              labelText: 'Email',
                              hintText: 'gabriel.fardoski@gmail.com',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: LoginInput(
                              controller: passwordController,
                              hintText: '',
                              labelText: 'Senha',
                              password: true,
                            ),
                          ),
                          GetBuilder<LoginController>(builder: (_) {
                            print("_.apiError: ${_.apiError}");
                            return _.apiError.length > 0 ? Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                '${_.apiError}',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ) : Container();
                          }),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: LoginButton(
                              onTap: () => onLogin(loginController),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void onLogin(LoginController loginController) async {
    if(_formKey.currentState!.validate()){
      loginController.email = emailController.text;
      loginController.password = passwordController.text;
      loginController.login().then((bool result){
        if(result == true){
          Get.toNamed('/list');
        }
      });
    }
  }
}
