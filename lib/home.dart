import 'package:flutter/material.dart';
import 'package:project/gird_view_section.dart';
import 'package:project/list_view_section.dart';
import 'package:project/page_view_section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Our Products',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),

                  Text(
                    'Featured Products',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ProductSlider(),
                  SizedBox(height: 20),
                  Text(
                    'Shop Our Collection',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ProductGridPage(),
                  SizedBox(height: 20),
                  Text(
                    'Hot Offers',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  OffersListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
