import 'package:documentauth/common/utils/custom_snackbar.dart';
import 'package:documentauth/common/utils/extensions/size_extension.dart';
import 'package:documentauth/common/utils/screen_size_util.dart';
import 'package:documentauth/constants/theme.dart';
import 'package:documentauth/model/user_model.dart';
import 'package:flutter/material.dart';

void initializeUtilContexts(BuildContext context) {
  ScreenSizeUtil.context = context;
  CustomSnackBar.context = context;
}

class UserDetailsView extends StatelessWidget {
  final UserModel user;
  const UserDetailsView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Authenticated"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 80,
              ),
              SizedBox(height: 20),
              Text(
                "Hey ${user.name}!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "You are Successfully Authenticated",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
