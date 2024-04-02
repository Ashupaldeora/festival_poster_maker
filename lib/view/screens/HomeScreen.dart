import 'package:festival_poster_maker/utils/variables_Lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1D2539),
        title: Image.asset(
          'assets/images/logo.webp',
          height: 90,
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isGridView = !isGridView;
                  });
                },
                icon: Icon(
                  (!isGridView) ? Icons.grid_view_rounded : Icons.list,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ],
      ),
      body: Stack(
        children: [
          bgContainerAndAppbar(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 35),
                  height: 800,
                  child: (!isGridView) ? homeListView() : homeGridView(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  GridView homeGridView() {
    return GridView.builder(
      itemCount: homeFestivalContainerLists.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => gridViewContainer(
          color: homeFestivalContainerLists[index]['color'],
          festivalImage: homeFestivalContainerLists[index]['image'],
          festivalName: homeFestivalContainerLists[index]['festivalName']),
    );
  }

  ListView homeListView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => homeContainers(
          color: homeFestivalContainerLists[index]['color'],
          festivalName: homeFestivalContainerLists[index]['festivalName'],
          subtitle: homeFestivalContainerLists[index]['subtitle'],
          festivalImage: homeFestivalContainerLists[index]['image']),
      itemCount: homeFestivalContainerLists.length,
    );
  }
}
