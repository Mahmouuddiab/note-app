import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/auth_cubit.dart';
import 'package:note_app/screens/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://jixaoecaocxdpgzkntne.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppeGFvZWNhb2N4ZHBnemtudG5lIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM4MzQwNzQsImV4cCI6MjA2OTQxMDA3NH0.ypvjH5nrP8dAnG9X5yQVoITilgtgkFFSV1gStsrZWOU"
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Login(),
      ),
    );
  }
}
