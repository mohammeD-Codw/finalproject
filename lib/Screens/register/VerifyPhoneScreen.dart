import 'package:easy_localization/src/public_ext.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyPhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(240, 240, 242, 1),
        title: Text(
          'verify'.tr(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<MainProvider>(builder: (context, provider, x) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Code_sent'.tr() + '${provider.phoneController}'),

          ],
        );
      }),
    );
  }
}
