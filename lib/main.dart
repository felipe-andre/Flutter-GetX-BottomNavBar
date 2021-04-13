import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AppController>(
        init: AppController(),
        builder: (controller) => IndexedStack(
          index: controller.navBarIndex,
          children: [
            HomePage(),
            BedtimePage(),
            CakePage(),
          ],
        ),
      ),
      bottomNavigationBar: GetX<AppController>(
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.navBarIndex,
          onTap: (index) => controller.onItemTapped(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bedtime),
              label: 'Bedtime',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              label: 'Cake',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class BedtimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class CakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class AppController extends GetxController {
  final _navBarIndex = 0.obs;

  set navBarIndex(value) => this._navBarIndex.value = value;
  get navBarIndex => this._navBarIndex.value;

  void onItemTapped(int index) {
    this.navBarIndex = index;
  }
}
