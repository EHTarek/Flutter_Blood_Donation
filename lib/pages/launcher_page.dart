import '../pages/login_page.dart';
import '../pages/donor_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../utils/helper_functions.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';

  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    redirectUser();
    super.initState();
  }

  Future<void> redirectUser() async {
    if (await getLoginStatus()) {
      final id = await getUserId();
      if (mounted) {
        await Provider.of<UserProvider>(context, listen: false).getUserById(id);

      }
      if (mounted) {
        Navigator.pushReplacementNamed(context, DonorListPage.routeName);
      }
    } else  {
      if (mounted)Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
