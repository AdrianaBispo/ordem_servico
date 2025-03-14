import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ordem_servico/modules/login/data/dtos/user_dto.dart';
import 'package:ordem_servico/theme/app_color.dart';
import '../../../theme/app_textstyle.dart';
import 'bloc/login_cubit.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<LoginCubit>();

    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _loginController,
                          decoration: InputDecoration(
                            hintText: 'login',
                            prefixIcon: Image.asset(
                              'assets/icons/Email.png',
                              width: 10,
                              height: 10,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            prefixIcon: Image.asset(
                              'assets/icons/Lock.png',
                              width: 10,
                              height: 10,
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.login(
                                UserDto(
                                  login: _loginController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Login',
                            style: AppTextStyle.instance.textButton,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (state.isLoading)
                          Center(
                              child: CircularProgressIndicator(
                            color: AppColor.instance.primary,
                          ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
