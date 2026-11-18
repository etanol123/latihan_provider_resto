
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'latihan_provider2/resto_provider.dart';
import 'latihan_provider2/menu_resto_page.dart';
import 'latihan_provider2/nota_pesanan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Resto Kampus Provider',
        debugShowCheckedModeBanner: false,
        initialRoute: '/menu-resto',
        routes: {
          '/menu-resto': (context) => const MenuRestoPage(),
          '/pesanan-resto': (context) => const NotaPesananPage(),
        },
      ),
    );
  }
}
