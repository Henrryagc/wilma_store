import 'package:flutter/material.dart';
import 'package:wilma_store/screens/home/pages/product_catalog/product_catalog.dart';
import 'package:wilma_store/screens/home/pages/product_prices.dart';
import 'widgets/home_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  static const routes = ['/','/product-prices', '', ''];
  List<Widget> pages = const [
    Text('eco', style: textStyle),
    Text('start', style: textStyle),
    Text('person', style: textStyle),
    Text('video', style: textStyle),
  ];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const ProductCatalog(),
    const ProductPrices(),
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:  _widgetOptions.elementAt(_currentIndex),
      ), // HomeContent(_widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: NavigationBar(
        elevation: 6.3,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
          // Navigator.pushNamed(context, routes[_currentIndex]);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.eco),
            icon: Icon(Icons.eco_outlined),
            label: 'eco',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'start',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'person',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.video_camera_back),
            icon: Icon(Icons.video_camera_back_outlined),
            label: 'video',
          ),
        ],
        animationDuration: const Duration(seconds:2),
      ),
    );
  }
}
