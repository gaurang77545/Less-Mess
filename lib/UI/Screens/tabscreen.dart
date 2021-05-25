import 'package:flutter/material.dart';
import 'package:lessmess/UI/Screens/counterscreen.dart';
import 'package:lessmess/UI/Screens/exitscreen.dart';
import 'package:lessmess/UI/Screens/qrscreen.dart';
import 'package:lessmess/UI/Widgets/AppDrawer.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:provider/provider.dart';
import 'package:lessmess/UI/Provider/number.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);
  static const routeName = './TabScreenRouteName';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<String> label = ["Info", "QRCode", "Stuff"];
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (ctx) => Number(),
    //     )
    //   ],
    //   child: 
    return Scaffold(
        appBar: AppBar(
          title: Text('Less Mess'),
        ),
        drawer: AppDrawer(),
        bottomNavigationBar: MotionTabBar(
          labels: ["Info", "QRCode", "ID"],
          initialSelectedTab: 'QRCode',
          tabIconColor: Colors.green,
          tabSelectedColor: Colors.red,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [
            Icons.info_outline,
            Icons.qr_code_outlined,
            Icons.ac_unit_outlined
          ],
          textStyle: TextStyle(color: Colors.red),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: Counter(),
            ),
            Container(
              child: QrScreen(),
            ),
            Container(
              child: ExitScreen(),
            ),
          ],
        ),
      )
    ;
  }
}
