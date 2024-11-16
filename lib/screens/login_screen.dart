
import 'package:avallis/blocs/login/login_bloc.dart';
import 'package:avallis/blocs/login/login_event.dart';
import 'package:avallis/blocs/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Object resData = [];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Credientials! '),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please enter a Valid username & password.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is LoginInitial) {
            return _buildInitialInput(context);
          } else if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoginSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showMyDialog();
              Navigator.pushNamed(context, '/home', arguments: state.loginResponse);
            });
            return Container();
          } else if (state is LoginFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showMyDialog();
            });
            return _buildInitialInput(context, error: state.error);
          }
          return Container();
        }));
  }

  Widget _buildInitialInput(BuildContext context, {String? error}) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ink.image(image: 'assets/images/logo-avallis.svg')
            SizedBox(
              width: 170,
              child: Image.asset('assets/images/ava.png'),
            ),
            const Text('Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                )),
            Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your Username',
                            prefixIcon: const Icon(Icons.person),
                            filled: true,
                            //fillColor: Colors.grey[200],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter username';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your Password',
                              prefixIcon: const Icon(Icons.password),
                              filled: true,
                              //fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.blue),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter password';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //pre-defined validation
                           // var userId = "Salim";
                            //var password = "Testing";
                            //proper validation
                             var userId = _userNameController.text;
                             var password = _passwordController.text;
                            print(
                                "userId--: $userId ---------- password : $password");
                            loginBloc.add(LoginButtonPressed(
                                userId: userId, password: password));
                          },
                          child: const Text(
                            'Login',
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
