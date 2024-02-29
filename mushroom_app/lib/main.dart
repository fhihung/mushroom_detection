import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mushroom_app/controllers/theme_controller.dart';
import 'package:mushroom_app/features/home/screens/home.dart';
import 'package:mushroom_app/utils/theme/theme.dart';
import 'package:mushroom_app/utils/utils.dart';

void main() {
  runApp(
    ProviderScope(child: const App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeMode = ref.watch(themeProvider);

        return MaterialApp(
          title: TTexts.appName,
          themeMode: themeMode,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          // initialBinding: GeneralBindings(),
          home: HomeScreen(),
        );
      },
    );
  }
}
