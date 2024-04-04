import 'package:festival_poster_maker/utils/templateList.dart';
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
    int index1 = ModalRoute.of(context)?.settings.arguments as int;

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
                      image: AssetImage(templates[index1][templateImageIndex])),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 5),
                        blurRadius: 20)
                  ]),
            ),
            Spacer(),
            (isEditingStarted)
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: (isEditingStarted) ? 150 : 0,
                    width: double.maxFinite,
                    decoration: BoxDecoration(color: Color(0xff1D2539)),
                    child: (isEditingStarted)
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Choose Background',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isEditingStarted = false;
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 80,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: templates[index1].length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          templateImageIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    templates[index1][index]))),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : null)
                : SizedBox(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 80,
          color: const Color(0xff1D2539),
          child: ListView.builder(
            itemCount: bottomNavigationIcons.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isEditingStarted = true;
                          });
                        },
                        icon: Icon(
                          bottomNavigationIcons[index]['icon'],
                          size: 35,
                          color: Colors.white,
                        )),
                    Text(
                      bottomNavigationIcons[index]['name'],
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          )),
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
            templateImageIndex = 0;
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh_rounded, color: Colors.white)),
      ],
    );
  }
}
