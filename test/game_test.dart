import 'package:bowling_app/services/game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

void main() {
  group('Game', () {
    late Game game;

    setUp(() {
      game = Game();
    });

    test('should calculate the score of a game correctly with strikes ', () {
      // Given
      game.frameScore = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10];
      // When
      final score = game.scoreGame();
      // Then
      expect(score, equals(300));
    });

    test('should calculate the score of a game correctly without spares and strike ', () {
      // Given
      game.frameScore = [4, 5, 5, 3, 7, 2, 2, 1, 2, 1, 4, 5, 5, 3, 7, 2, 2, 1, 2, 1];
      // When
      final score = game.scoreGame();
      // Then
      expect(score, equals(64));
    });

    test('should calculate the score of a game correctly with spares ', () {
      // Given
      game.frameScore = [2,8,2,8,2,8,2,8,2,8,2,8,2,8,2,8,2,8,2,8];
      // When
      final score = game.scoreGame();
      // Then
      expect(score, equals(108));
    });


    test('should calculate the score of a game with random score correctly with spares and strikes ', () {
      // Given
      game.frameScore = [6,4,8,0,3,4,7,1,8,1,9,1,1,0,10,9,0,1,3];
      // When
      final score = game.scoreGame();
      // Then
      expect(score, equals(104));
    });
    
  });
}

