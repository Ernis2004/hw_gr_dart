import 'game_character.dart';
import 'super_ability.dart';
import 'dart:math';
import 'heroes.dart';
import 'rpg_game.dart';

class Boss extends GameCharacter {
  SuperAbility? defence;

  Boss(super.health, super.damage, super.name);

  void attack(List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive()) {
        if (hero is Berserk && defence != SuperAbility.blockRevert) {
          
          int blocked = (RpgGame.random.nextInt(2) + 1) * 5; // 5,10
          hero.blockedDamage = blocked;
          hero.health -= (damage - blocked);
        } else {
          hero.health -= damage;
        }
      }
    }
  }

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values; 
    defence = variants[RpgGame.random.nextInt(variants.length)]; // 0,1,2,3
  }

  @override
  String toString() {
    String currentDefence = 'No defence';
    if (defence != null) {
      currentDefence = defence!.name;
    }
    return '${super.toString()} defence: $currentDefence';
  }
  // For Berserk
bool isStunned = false;
}