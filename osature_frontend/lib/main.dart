import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/adaptaciones/view/adapt_document_screen.dart';
import 'features/adaptaciones/view_model/adapt_document_viewmodel.dart';
import 'shared/accessibility/accessibility_view_model.dart';

void main() {
  runApp(const OsatureApp());
}

class OsatureApp extends StatelessWidget {
  const OsatureApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Guarda esado App
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccessibilityViewModel()),
        ChangeNotifierProvider(create: (context) => AdaptDocumentViewModel()),
      ],
      child: MaterialApp(
        title: 'Osature',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.build(),
        home: const AdaptDocumentScreen(),
      ),
    );
  }
}
