import 'package:flutter/material.dart';
import 'package:flutter_data/pages/create/bindings.dart';
import 'package:flutter_data/pages/create/create.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_data/db/db_helper.dart';
import 'package:flutter_data/pages/home/bindings.dart';
import 'package:flutter_data/pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: "/",
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(
            name: "/", page: () => const HomePage(), binding: HomeBindings()),
        GetPage(
            name: "/create",
            page: () => const CreatePage(),
            binding: CreateBindings()),
      ],
    );
  }
}
