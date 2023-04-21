import 'package:bowling_app/services/game.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game game = new Game();
  int? score;
  List? allFrames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*
            * Show the final score and all thoses throws of player
             */
            if(score != null)
            Text("Score final : " + score.toString(), style:  TextStyle(color: Colors.red, fontSize: 18)),
            SizedBox(height : 20),
            if(allFrames != null)
            Text(allFrames.toString()),
            SizedBox(height : 20),
            ElevatedButton(onPressed: () {
              game.BowlingThrow();
              setState(() {
                score = game.scoreGame();
                allFrames = game.frameScore;
              });
            }, child: Text("Play", style:  TextStyle(color: Colors.white, fontSize: 18),)),
          ],
        )
      ),
    );
  }
}