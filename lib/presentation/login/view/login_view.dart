import 'package:flutter/material.dart';
import 'package:flutter_next_evel/app/di.dart';
import 'package:flutter_next_evel/data/data_source/remote_data_source.dart';
import 'package:flutter_next_evel/data/repository/repository_imp.dart';
import 'package:flutter_next_evel/domain/repository/reposetory.dart';
import 'package:flutter_next_evel/domain/usecase/login_usecase.dart';
import 'package:flutter_next_evel/presentation/login/viewmodel/loginviewmodel.dart';
import 'package:flutter_next_evel/presentation/ressourses/assets_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/color_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/routes_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/string_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Loginviewmodel _viewmodel = instance<Loginviewmodel>();

  _bind() {
    _viewmodel.start();
    _usernameController
        .addListener(() => _viewmodel.SetUsername(_usernameController.text));
    _passwordController
        .addListener(() => _viewmodel.SetPassword(_passwordController.text));
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: PaddingSize.s100),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Container(width:200 , child: Image.asset(ImageAssets.splashLogo)),
                  ),
                  SizedBox(
                    height: MargineManger.m24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: PaddingSize.s24, right: PaddingSize.s24),
                    child: StreamBuilder(
                        stream: _viewmodel.isUsernamevalid,
                        builder: (context, snaphot) {
                          return TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _usernameController,
                            decoration: InputDecoration(
                              errorText: (snaphot.data ?? true)
                                  ? null
                                  : AppString.usernameErrore,
                              hintText: AppString.username,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: MargineManger.m12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: PaddingSize.s24, right: PaddingSize.s24),
                    child: StreamBuilder(
                        stream: _viewmodel.isPasswordvalid,
                        builder: (context, snaphot) {
                          return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              errorText: (snaphot.data ?? true)
                                  ? null
                                  : AppString.passwordErrore,
                              hintText: AppString.password,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: MargineManger.m12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: PaddingSize.s24, right: PaddingSize.s24),
                    child: StreamBuilder(
                        stream: _viewmodel.isPasswordvalid,
                        builder: (context, snaphot) {
                          return ElevatedButton(
                              onPressed: () {
                                (snaphot.data ?? false)
                                    ? () {
                                        _viewmodel.login();
                                      }
                                    : null;
                              },
                              child: Text(AppString.login));
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: PaddingSize.s24, right: PaddingSize.s24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.forgetPasswordRoutes);
                          },
                          child: Text(
                            AppString.forgetpassword,
                            style: TextStyle(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.registerRoutes);
                          },
                          child: Text(
                            AppString.notMember,
                            style: TextStyle(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }
}
