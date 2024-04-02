import 'package:festival_poster_maker/utils/variables_Lists.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/widgets.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: editScreenAppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400,
              margin: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          homeFestivalContainerLists[index]['image'])),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0, 5),
                        blurRadius: 20)
                  ]),
            )
          ],
        ),
      ),
    );
  }

  AppBar editScreenAppBar() {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Color(0xff1D2539),
      title: Text(
        "Edit",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh_rounded, color: Colors.blue)),
      ],
    );
  }
}
