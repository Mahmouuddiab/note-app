import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/auth_states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit():super(AuthInitialState());
  final supabase = Supabase.instance.client;

  Future<void> register(String email, String password) async {
    emit(RegisterLoading());
    final response = await supabase.auth.signUp(email: email, password: password);
    if (response.user != null) {
      print('User signed up: ${response.user!.email}');
      emit(RegisterSuccess());
    } else {
      print('Sign up error: ${response.session}');
      emit(RegisterError());
    }
  }

  Future<void> login(String email, String password) async {
    LoginLoading();
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user != null) {
      print('User signed in: ${response.user!.email}');
      emit(LoginSuccess());
    } else {
      print('Sign in failed');
      emit(LoginError());
    }
  }

  void logout() {
    supabase.auth.signOut();
    emit(LogoutState());
  }

}