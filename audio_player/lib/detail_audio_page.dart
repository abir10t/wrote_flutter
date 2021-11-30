import 'package:audio_player/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:audio_player/app_colors.dart' as AppColors;

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  _DetailAudioPageState createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              color: AppColors.loveColor,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.2,
            height: screenHeight * 0.36,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Text(
                    "The Water Cure",
                    style: TextStyle(
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, 18, screenHeight),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ayenir"),
                  ),
                  Text(
                    "Martin Hyatt",
                    style: TextStyle(
                      fontSize: AdaptiveTextSize()
                          .getadaptiveTextSize(context, 12, screenHeight),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.12,
            left: (screenWidth - 150) / 2,
            right: (screenWidth - 150) / 2,
            height: screenHeight*0.16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white,width: 2),

              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5),
                  image: DecorationImage(
                    image: AssetImage("assets/img/pic-1.png"),
                    fit: BoxFit.cover,
                  )
                ),
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
