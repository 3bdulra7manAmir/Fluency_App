import 'package:device_preview/device_preview.dart';
import 'package:fluency/Config/router/app_router.dart';
import 'package:fluency/Features/teachers/data/models/teachers_data_linker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TeacherInfoAdapter());

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => const FluencyApp()),
    ),
  );
}

class FluencyApp extends StatelessWidget
{
  const FluencyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp.router(
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
