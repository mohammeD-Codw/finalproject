import 'package:final_project/Providers/MainProvider.dart';
import 'package:final_project/Screens/register/loginScreen.dart';
import 'package:final_project/Screens/vedio.dart';
import 'package:final_project/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Account',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('Account',style: TextStyle(color: Colors.black,fontSize: 24),),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: provider.userLogged.imageUrl != null
                      ? NetworkImage(provider.userLogged.imageUrl)
                      : null,
                  radius: 50,
                ),
              ),
              ListTile(
                title: Text('Favourite'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('Edit Account'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('Setting and Privacy'),
                trailing: IconButton(
                    onPressed: () {
                      RouterClass.routerClass.pushToScreen(YoutubeAppDemo());
                    },
                    icon: Icon(Icons.arrow_forward_ios)),
              ),
              ListTile(
                title: Text('Help'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  provider.logOut();
                  RouterClass.routerClass
                      .pushReplacementToScreen(LoginScreen());
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
