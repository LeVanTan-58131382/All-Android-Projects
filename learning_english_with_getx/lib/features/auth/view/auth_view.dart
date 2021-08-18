import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/auth/controller/auth_controller.dart';

class AuthView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      body: Obx(() {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            // onTap: () => FocusScope.of(context).unfocus(),
            onTap: () => Get.focusScope!.unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppStyles.white,
                        AppStyles.backgroundColorDark2,
                      ],
                      stops: [0.75, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 50.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            controller.isLogin.isTrue ? 'Đăng nhập' : "Đăng ký",
                            style: TextStyle(
                              color: AppStyles.backgroundColorDark,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          controller.isLogin.isTrue
                              ? Container()
                              : ElasticInLeft(child: buildNameTextField(controller)),

                          ElasticInLeft(child: buildEmailTextField(controller)),

                          ElasticInLeft(child: buildPasswordTextField(controller)),
                          
                          controller.isLogin.isTrue
                              ? Container()
                              : ElasticInLeft(child: buildRePasswordTextField(controller)),
                          
                          controller.isLogin.isTrue
                              ? ElasticInLeft(child: buildForgotPasswordField())
                              : Container(),
                          
                          controller.isLogin.isTrue
                              ? ElasticInLeft(child: buildLoginButton(controller))
                              : ElasticInLeft(child: buildRegisterButton(controller)),
                          
                          SizedBox(
                            height: 20,
                          ),
                          
                          controller.isLogin.isTrue
                              ? ElasticInLeft(child: buildPassToRegister(controller))
                              : ElasticInLeft(child: buildPassToLogin(controller)),

                          SizedBox(height: 20.0,),

                          controller.isLoggingCircleLoading.isTrue || controller.isRegisteringCircleLoading.isTrue ?
                          BounceInUp(child: SpinKitCircle(color: Colors.red)) : Container(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  GestureDetector buildPassToLogin(AuthController controller) {
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Bạn đã có tài khoản? ',
              style: TextStyle(
                color: AppStyles.backgroundColorDark,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Đăng nhập',
              style: TextStyle(
                color: AppStyles.lightRed,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        controller.toggleIsLogin();
      },
    );
  }

  GestureDetector buildPassToRegister(AuthController controller) {
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Bạn Chưa có tài khoản? ',
              style: TextStyle(
                color: AppStyles.backgroundColorDark,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Đăng ký',
              style: TextStyle(
                color: AppStyles.lightRed,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        controller.toggleIsLogin();
      },
    );
  }

  Container buildRegisterButton(AuthController controller) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
// color: Colors.red,
      ),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.register();
            // FocusScope.of(context).unfocus();
            Get.focusScope!.unfocus();
          }
        },
        child: Center(
          child: Text(
            'Đăng ký',
            style: TextStyle(
              color: AppStyles.backgroundColorDark,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(AppStyles.backgroundColorBrow),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: AppStyles.backgroundColorDark)))),
      ),
    );
  }

  Container buildLoginButton(AuthController controller) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
// color: Colors.red,
      ),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.login();
            // FocusScope.of(context).unfocus();
            Get.focusScope!.unfocus();
          }
        },
        child: Center(
          child: Text(
            'Đăng nhập',
            style: TextStyle(
              color: AppStyles.backgroundColorDark,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(AppStyles.backgroundColorBrow),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: AppStyles.backgroundColorDark)))),
      ),
    );
  }

  Container buildForgotPasswordField() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text(
          'Quên mật khẩu?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Padding buildRePasswordTextField(AuthController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                controller.passwordConfirmation = text.obs;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập lại mật khẩu";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                color: AppStyles.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppStyles.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.backgroundColorDark)),
                hintText: 'Nhập lại mật khẩu của',
                labelText: 'Nhập lại mật khẩu',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppStyles.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildPasswordTextField(AuthController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                controller.password = text.obs;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập mật khẩu!";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                color: AppStyles.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppStyles.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.backgroundColorDark)),
                hintText: 'Nhập mật khẩu của bạn',
                labelText: 'Mật khẩu',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppStyles.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildEmailTextField(AuthController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                controller.email = text.obs;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập email!";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: AppStyles.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppStyles.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.backgroundColorDark)),
                hintText: 'Nhập email của bạn',
                labelText: 'Email',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.email,
                  color: AppStyles.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildNameTextField(AuthController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                controller.name = text.obs;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập tên!";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppStyles.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppStyles.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.backgroundColorDark)),
                hintText: 'Nhập tên của bạn',
                labelText: 'Tên',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppStyles.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final kHintTextStyle = TextStyle(
  color: AppStyles.backgroundColorDark,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: AppStyles.backgroundColorDark,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: AppStyles.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
