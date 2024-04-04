import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magical_change/screens/home_screen.dart';


void main() => runApp(
     ProviderScope(
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
