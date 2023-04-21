import 'dart:math';

class Game {
  List frameScore = []; 
  int? currentFrameS;

  int firstThrow = 0;
  int secThrow = 0;
  /*
  * Method to permit to throw for 10 frames the bowling ball
  */
  BowlingThrow() {
    frameScore.clear();
    for(var i = 0; i < 10; i++) {
      firstThrow = Random().nextInt(11);
      // If it's strike
      if(firstThrow == 10) {
        frameScore.add(10);
      } else {
        // for spare or others
       secThrow = Random().nextInt(11 - firstThrow);
       frameScore.add(firstThrow);
       frameScore.add(secThrow);
       if(i == 9 && (firstThrow + secThrow) == 10) {
         frameScore.add(Random().nextInt(11));
       } 
      }
      if(i == 9 && firstThrow == 10) {
        int lastThrow  = Random().nextInt(11);
        frameScore.add(lastThrow);
        if(lastThrow != 10) {
          frameScore.add(Random().nextInt(11 - lastThrow));
        } else {
          frameScore.add(Random().nextInt(11));
        }
      }
     }
  }

  scoreGame() {
    int dataLength  = frameScore.length;
    int score = 0;
    int frame = 0; 
    /*
    * Counting score of different throws depending if is stirke, spare or else
    */
    for(var i = 0; i < dataLength; i++){
        if(isStrike(frame)) {
            if( i  == dataLength - 2) break;
            score +=  10 + strikeBonus(frame); 
            frame ++;
        } else if(isSpare(frame)) {
            if( i  == dataLength - 2) break;
            score += 10 + spareBonus(frame);
            frame += 2;
            i++;
        } else {
            score += sumOfFrameScore(frame);
            frame += 2;
            i++;
        }  
      }
    return score;
   }

  bool isStrike(int frame) {
    return frameScore[frame] == 10; 
  }

  bool isSpare(int frame) {
    return sumOfFrameScore(frame) == 10;
  }

  int sumOfFrameScore(int frame) {
    return frameScore[frame] + frameScore[frame +1];
  }

  int spareBonus(int frame) {
    return frameScore[frame+2];
  }

  int strikeBonus(int frame) {
      return frameScore[frame] + frameScore[frame + 1];
  }

}