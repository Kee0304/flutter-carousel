import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_demo/screens/preview_screen.dart';


class CapturesScreen extends StatelessWidget {
  final List<File> imageFileList;

  const CapturesScreen({required this.imageFileList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Captures',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                ),
              ),
            ),
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    enableInfiniteScroll: false,

                  ),
                  items: imageFileList.map((file) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber
                            ),
                            child: Image.file(
                              file,
                              fit: BoxFit.cover,
                            )
                        );
                      },
                    );
                  }).toList(),
                ),
              ]
            ),
            Row(
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {} ,
                    icon: Icon(Icons.play_arrow),
                  ),
                ),
                Container(
                  child: LinearProgressIndicator(
                    value: 0
                  )
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}

