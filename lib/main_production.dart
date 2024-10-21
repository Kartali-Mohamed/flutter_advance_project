import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart' as di;
import 'core/routing/app_router.dart';
import 'doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    di.setupGetIt(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
