import 'game_character.dart';
import 'super_ability.dart';
import 'boss.dart';
import 'rpg_game.dart';

abstract class Hero extends GameCharacter {
  SuperAbility _ability;

  Hero(super.health, super.damage, super.name, this._ability);

  SuperAbility get ability => _ability;

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = damage * (RpgGame.random.nextInt(5) + 2);
    boss.health -= crit;
    print('Warrior $name hits critically: $crit');
  }
}

class Magic extends Hero {
  Magic(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      for (var hero in heroes) {
        if (hero.isAlive() && hero != this) {
          int boost = RpgGame.random.nextInt(5) + 1;
          hero.damage += boost;
        }
      }
      print('Magic $name boosted team attack!');
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;

  Berserk(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted: $blockedDamage');
  }
}

class Medic extends Hero {
  int healPoints;

  Medic(int health, int damage, String name, this.healPoints)
      : super(health, damage, name, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && hero != this) {
        hero.health += healPoints;
      }
    }
  }
}

class Golem extends Hero {
  Golem(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.protect);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Lucky extends Hero {
  Lucky(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.dodge);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Witcher extends Hero {
  bool hasResurrected = false;

  Witcher(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.resurrect);

  @override
  void attack(Boss boss) {
    // Witcher не атакует
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive() || hasResurrected) return;

    for (var hero in heroes) {
      if (hero != this && !hero.isAlive()) {
        hero.health = health;
        health = 0;
        hasResurrected = true;

        print(
          'Witcher $name sacrificed himself to resurrect ${hero.name}',
        );
        break;
      }
    }
  }
}

class Thor extends Hero {
  Thor(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}

class Ludoman extends Hero {
  Ludoman(int health, int damage, String name)
      : super(health, damage, name, SuperAbility.luck);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int dice1 = RpgGame.random.nextInt(6) + 1;
    int dice2 = RpgGame.random.nextInt(6) + 1;

    print('Ludoman $name rolled: $dice1 and $dice2');

    if (dice1 == dice2) {
      int bonusDamage = dice1 * dice2;
      boss.health -= bonusDamage;

      print(
        'Ludoman $name hit jackpot! Extra damage: $bonusDamage',
      );
    }
  }
}