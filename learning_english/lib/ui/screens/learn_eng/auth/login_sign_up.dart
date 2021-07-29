import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learning_english/configs/colors.dart';
import 'package:learning_english/core/dispatch_listener_event.dart';
import 'package:learning_english/core/services/auth_service.dart';

final kHintTextStyle = TextStyle(
  color: AppColors.backgroundColorDark,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: AppColors.backgroundColorDark,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: AppColors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  String email = "";
  String password = "";
  String rePassword = "";

  bool _signUp = false;

  AuthService authService = new AuthService();

  final _formKey = GlobalKey<FormState>();

  List<String> listValidationFailed = [];

  bool loginSuccessful = false;
  bool registerSuccessful = false;

  @override
  void initState() {
    super.initState();

    authService.init();

    DispatchListenerEvent.listener("Login_Failed",
        _buildNotificationForLoginFailed, "Login_Failed");
    DispatchListenerEvent.listener("Register_Failed",
        _buildNotificationForRegisterFailed, "Register_Failed");
    DispatchListenerEvent.listener("Login_Successful",
        _markLoginSuccessful, "Login_Successful");
    DispatchListenerEvent.listener("Register_Successful",
        _markRegisterSuccessful, "Register_Successful");
  }

  @override
  void dispose() {
    super.dispose();
    DispatchListenerEvent.remove("Login_Failed", "Login_Failed");
    DispatchListenerEvent.remove("Register_Failed", "Register_Failed");
    DispatchListenerEvent.remove("Login_Successful", "Login_Successful");
    DispatchListenerEvent.remove("Register_Successful", "Register_Successful");
  }

  _register(
      String name, String email, String password, String rePassword) async {
    // Map<String, String> user = new Map<String, String>();

    // user = {"name": name, "email": email, "password": password, "password_confirmation": rePassword};

    await authService.registerToServer(data: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": rePassword
    });
  }

  _login(String email, String password) async {
    // Map<String, String> user = new Map<String, String>();

    // user = {"email": email,  "password": password};

    await authService
        .loginToServer(data: {"email": email, "password": password});
  }

  _buildNotificationForLoginFailed(String messages) {

    listValidationFailed.add("Đăng nhập thất bại");

    listValidationFailed.add(messages);

  }

  _buildNotificationForRegisterFailed(List<String> messages) {

    listValidationFailed.add("Đăng ký thất bại");

    for(var i = 0; i < messages.length; i++){
      listValidationFailed.add(messages[i]);
    }
  }

  _markRegisterSuccessful(String temp)
  {
    setState(() {
      registerSuccessful = true;
    });
  }

  _markLoginSuccessful(String temp)
  {
    setState(() {
      loginSuccessful = true;
    });
  }

  Widget _buildNotificationForLoginSuccessful() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        color: Colors.green,
      ),
      child: Center(child: Text("Đăng nhập thành công")),
    );
  }

  Widget _buildNotificationForRegisterSuccessful() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        color: Colors.green,
      ),
      child: Center(child: Text("Đăng ký thành công")),
    );
  }

  Widget _buildValidateFailed() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        // child: ListView(
        //   shrinkWrap: true,
        //   children: [
        //     ...List.generate(
        //       listValidationFailed.length,
        //       (index) => Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: Text(
        //           '${listValidationFailed[index]}',
        //           style: TextStyle(fontSize: 15, color: Colors.red),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
          child: StaggeredGridView.countBuilder(
            padding: EdgeInsets.all(0),
            crossAxisCount: 1,
            itemCount: listValidationFailed.length,
            crossAxisSpacing: 10,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                              '${listValidationFailed[index]}',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                ),
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          ),
        ),
      ),
    );
  }

  _reset()
  {
    setState(() {
      listValidationFailed = [];
      loginSuccessful = false;
      registerSuccessful = false;
    });
  }

  Widget _buildEmailTF() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                this.email = text;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập email!";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: AppColors.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.backgroundColorDark)),
                hintText: 'Nhập email của bạn',
                labelText: 'Email',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.email,
                  color: AppColors.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserNameTF() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                this.name = text;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập tên!";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppColors.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.backgroundColorDark)),
                hintText: 'Nhập tên của bạn',
                labelText: 'Tên',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppColors.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                this.password = text;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập mật khẩu!";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                color: AppColors.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.backgroundColorDark)),
                hintText: 'Nhập mật khẩu của bạn',
                labelText: 'Mật khẩu',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRePasswordTF() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                this.rePassword = text;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bạn chưa nhập lại mật khẩu";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                color: AppColors.backgroundColorDark,
                fontFamily: 'OpenSans',
              ),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.backgroundColorDark)),
                hintText: 'Nhập lại mật khẩu của',
                labelText: 'Nhập lại mật khẩu',
                labelStyle: kLabelStyle,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.backgroundColorDark,
                ),
                prefixText: ' ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
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

  Widget _buildLoginBtn() {
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
            this._reset();
            this._login(email, password);
            FocusScope.of(context).unfocus();
          }
        },
        child: Center(
          child: Text(
            'Đăng nhập',
            style: TextStyle(
              color: AppColors.backgroundColorDark,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(AppColors.backgroundColorBrow),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: AppColors.backgroundColorDark)))),
      ),
    );
  }

  Widget _buildRegisterBtn() {
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
            this._reset();
            this._register(name, email, password, rePassword);
            FocusScope.of(context).unfocus();
          }
        },
        child: Center(
          child: Text(
            'Đăng ký',
            style: TextStyle(
              color: AppColors.backgroundColorDark,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(AppColors.backgroundColorBrow),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: AppColors.backgroundColorDark)))),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Bạn Chưa có tài khoản? ',
            style: TextStyle(
              color: AppColors.backgroundColorDark,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Đăng ký',
            style: TextStyle(
              color: AppColors.lightRed,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInBtn() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Bạn đã có tài khoản? ',
            style: TextStyle(
              color: AppColors.backgroundColorDark,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Đăng nhập',
            style: TextStyle(
              color: AppColors.lightRed,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                      AppColors.backgroundColorBrow,
                      AppColors.white,
                    ],
                    stops: [0.1, 0.9],
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
                          _signUp == false ? 'Đăng nhập' : "Đăng ký",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //_buildNotificationForLoginSuccessful(),
                        loginSuccessful == true ? _buildNotificationForLoginSuccessful() : Container(),
                        registerSuccessful == true ? _buildNotificationForRegisterSuccessful() : Container(),
                        listValidationFailed.isNotEmpty ? _buildValidateFailed() : Container(),
                        _signUp == false ? Container() : _buildUserNameTF(),
                        _buildEmailTF(),
                        _buildPasswordTF(),
                        _signUp == false ? Container() : _buildRePasswordTF(),
                        _signUp == false
                            ? _buildForgotPasswordBtn()
                            : Container(),
                        _signUp == false
                            ? _buildLoginBtn()
                            : _buildRegisterBtn(),
                        SizedBox(
                          height: 20,
                        ),
                        _signUp == false
                            ? GestureDetector(
                                child: _buildSignUpBtn(),
                                onTap: () {
                                  setState(() {
                                    print("bạn vừa bấm vào nút đăng ký");
                                    _signUp = !_signUp;
                                  });
                                },
                              )
                            : GestureDetector(
                                child: _buildSignInBtn(),
                                onTap: () {
                                  setState(() {
                                    print("bạn vừa bấm vào nút đăng nhập");
                                    _signUp = !_signUp;
                                  });
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
