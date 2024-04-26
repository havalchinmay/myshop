import 'package:flutter/material.dart';
import 'package:myshop/helpers/custom_route.dart';
import 'package:myshop/providers/cart.dart';
import 'package:myshop/providers/orders.dart';
import 'package:myshop/screens/auth_screen.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'package:myshop/screens/edit_product_screen.dart';
import 'package:myshop/screens/orders_screen.dart';
import 'package:myshop/screens/product_overview_screen.dart';
import 'package:myshop/screens/splash-screen.dart';
import 'package:myshop/screens/users_products_screen.dart';
import 'package:provider/provider.dart';

// import './screens/product_overview_screen.dart';
import 'package:myshop/providers/products.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'package:myshop/providers/auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (context) => Products(),
            update: (context, auth, previousProducts) => Products(
              // previousProducts == null ? [] : previousProducts.items,
              authToken: auth.token,
              userId: auth.userId,
            ),
            // value: Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (context) => Orders(),
            update: (context, auth, previousOrders) => Orders(
              // previousOrders == null ? [] : previousOrders.orders,
              userId: auth.userId,
              authToken: auth.token,
            ),
          )
        ],
        child: Consumer<Auth>(
          builder: (context, auth, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MyShop',
              theme: ThemeData(
                  primarySwatch: Colors.purple,
                  canvasColor: Colors.orange,
                  fontFamily: 'Lato',
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  pageTransitionsTheme: PageTransitionsTheme(builders: {
                    TargetPlatform.android: CustomPageTransitionBuilder(),
                  })),
              home: auth.isAuth
                  ? ProductOverviewScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? SplashScreen()
                              : AuthScreen(),
                    ),
              routes: {
                ProductDetailScreen.routeName: (ctx) =>
                    const ProductDetailScreen(),
                CartScreen.routeName: (context) => const CartScreen(),
                OrdersScreen.routeName: (context) => const OrdersScreen(),
                UserProductsScreen.routeName: (context) =>
                    const UserProductsScreen(),
                EditProductScreen.routeName: (context) =>
                    const EditProductScreen(),
              }),
        ));
  }
}
