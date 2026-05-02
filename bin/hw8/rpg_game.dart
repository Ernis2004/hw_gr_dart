import 'dart:math';

import 'heroes.dart';
import 'boss.dart';

class RpgGame {
  static int roundNumber = 0;
  static Random random = Random();
  static void startGame() {
    Boss boss = Boss(1000, 50, 'Goblin');

    Warrior warrior1 = Warrior(280, 10, 'Oskar');
    Warrior warrior2 = Warrior(270, 15, 'Arthur');
    Magic magic = Magic(290, 10, 'Oleg');
    Berserk berserk = Berserk(260, 10, 'Azamat');
    Medic doc = Medic(250, 5, 'Doc', 15);
    Medic junior = Medic(300, 5, 'Junior', 5);
    Golem golem = Golem(500, 8, 'Stone');
    Lucky lucky = Lucky(270, 10, 'Flash');
    Witcher witcher = Witcher(300, 0, 'Geralt');
    Thor thor = Thor(290, 14, 'Thor');
    Ludoman ludoman = Ludoman(260, 9, 'Casino');
    List<Hero> heroes = [warrior1, doc, magic, warrior2, berserk, junior, golem, lucky, witcher, thor, ludoman];
    _showStatistics(boss, heroes);

    while (!isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static bool isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!');
      return true;
    }
    bool allHeroesDead = true;
    for (var hero in heroes) {
      if (hero.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    boss.attack(heroes);
    for (var hero in heroes) {
      if (hero.isAlive() && boss.isAlive() && hero.ability != boss.defence) {
        hero.attack(boss);
        hero.applySuperPower(boss, heroes);
      }
    }
    _showStatistics(boss, heroes);
  }

  static void _showStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND: $roundNumber ---------------');
    print(boss);
    for (var hero in heroes) {
      print(hero);
    }
  }
}
