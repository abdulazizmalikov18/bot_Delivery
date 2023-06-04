// import 'package:bot_delivery/assets/themes/theme.dart';
// import 'package:bot_delivery/features/main/presentation/views/chek_view.dart';
// import 'package:bot_delivery/features/main/presentation/views/info_commit.dart';
// import 'package:bot_delivery/features/main/presentation/views/my_home_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {

//   }
// }

import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:bot_delivery/features/main/presentation/views/change_info.dart';
import 'package:bot_delivery/features/main/presentation/views/chek_view.dart';
import 'package:bot_delivery/features/main/presentation/views/info_commit.dart';
import 'package:bot_delivery/features/main/presentation/views/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrdersBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Mazmun Group',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        initialRoute: '/home',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return CupertinoPageRoute(
                  builder: (_) => const MyHomePage(), settings: settings);
            case '/info':
              return CupertinoPageRoute(
                  builder: (_) => const InfoCommitView(), settings: settings);
            case '/chek':
              return CupertinoPageRoute(
                  builder: (_) => const ChekView(), settings: settings);
            case '/change':
              return CupertinoPageRoute(
                  builder: (_) => const ChangeInfoView(), settings: settings);
          }
          return null;
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material!'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Take me deeper!'),
          onPressed: () => Navigator.pushNamed(context, 'deeper'),
        ),
      ),
    );
  }
}

class DeeperPage extends StatelessWidget {
  const DeeperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material!'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            child: const Text('Home :)'),
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/')),
          ),
          ElevatedButton(
            child: const Text('Deeper!'),
            onPressed: () => Navigator.pushNamed(context, 'deeper'),
          ),
        ],
      ),
    );
  }
}
