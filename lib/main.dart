import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magical_change/providers/user_data_provider.dart';
import 'package:magical_change/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => UserDataProvider(),
        child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: child,
            );
          },
          child: const HomeScreen(),
        ),
      ),
    );
