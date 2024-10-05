import 'package:exam_project_app/profile_page_widget/email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('ACCOUNT',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
            SettingsTile(
              icon: Icons.person,
              title: 'Update Profile',
              subtitle: 'Update username, country, etc',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.email,
              title: 'Change Email Address',
              subtitle: 'madias@yahoo.com',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.lock,
              title: 'Change Password',
              subtitle: 'last change 1 year ago',
              onTap: () {
                Get.to(ResetPasswordScreen());
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('OTHER',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
            SettingsTile(
              icon: Icons.notifications,
              title: 'Notification',
              subtitle: '',
              isThreeLine: false,
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (bool value) {},
              ),
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.bar_chart,
              title: 'Change Difficulty',
              subtitle: 'Easy, normal, hard',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.help,
              title: 'FAQ',
              subtitle: 'Most frequently asked question',
              onTap: () {},
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isThreeLine;
  final Widget? trailing;
  final VoidCallback onTap; 

  SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isThreeLine = true,
    this.trailing,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      subtitle: Text(subtitle),
      isThreeLine: isThreeLine,
      trailing: trailing ?? Icon(Icons.arrow_forward_ios),
      onTap: onTap, 
    );
  }
}
