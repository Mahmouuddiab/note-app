import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/auth_cubit.dart';
import 'package:note_app/bloc/auth_states.dart';
import 'package:note_app/screens/login.dart';
import 'package:note_app/widgets/custom_field.dart';

class Register extends StatelessWidget {
  Register({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthCubit authCubit = AuthCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      bloc: authCubit,
      listener: (context, state) {
        if (state is RegisterLoading) {
          CircularProgressIndicator();
        }
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Success Register")));
        }
        if (state is RegisterError) {
          Center(child: Text("Auth Error"));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 20,
                children: [
                  Image.asset("assets/register.png", fit: BoxFit.cover),
                  Text(
                    "Create account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  CustomField(
                    hint: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  CustomField(
                    hint: "password",
                    controller: passwordController,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        authCubit.register(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    spacing: 6,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
