import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/services/theme_services.dart';
import 'package:flutter_to_do_app/ui/home_page.dart';
import 'package:flutter_to_do_app/ui/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // GetStorage is initialize first. then runApp will be run.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Flutter Demo',
     theme: Themes.light,
     darkTheme: Themes.dark,
     themeMode: ThemeServices().theme,
     home: const HomePage(),
   );
  }
}
