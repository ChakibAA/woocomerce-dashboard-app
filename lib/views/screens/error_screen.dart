import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:woocomerceadmin/utils/routes/app_routes.dart';

import '../../utils/constant.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppConstants.errorMsg, textAlign: TextAlign.center),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(AppRoutes.shopList);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Réessayez',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
