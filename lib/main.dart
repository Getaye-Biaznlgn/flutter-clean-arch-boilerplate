import 'package:arch_demo/core/theme/app_theme.dart';
import 'package:arch_demo/dependency_injection.dart';
import 'package:arch_demo/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:arch_demo/route.dart';
import 'package:flutter/material.dart';
import "package:arch_demo/dependency_injection.dart" as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://examplePublicKey@o0.ingest.sentry.io/0';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TodoBloc>(),
      child: MaterialApp(
        title: 'Arch Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        onGenerateRoute: AppNavigator.onGenerateRoute,
        navigatorKey: AppNavigator.navigatorKey,
        // initialRoute: Paths.home,
      ),
    );
  }
}
