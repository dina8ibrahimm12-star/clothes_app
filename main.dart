import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/products_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clothes App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: auth.isAuth ? const HomeScreen() : const SplashScreen(),
          routes: {
            AuthScreen.routeName: (_) => const AuthScreen(),
            HomeScreen.routeName: (_) => const HomeScreen(),
            CartScreen.routeName: (_) => const CartScreen(),
            ProfileScreen.routeName: (_) => const ProfileScreen(),
          },
        ),
      ),
    );
  }
}
