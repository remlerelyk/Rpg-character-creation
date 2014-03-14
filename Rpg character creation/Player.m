//
//  Experience.m
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "Player.h"

@implementation Player
-(id)init{
    _exp = 0;
    _lvl = 1;
    _strength = 1;
    _dexterity = 1;
    _health = 1;
    _magic = 1;
    _totalStats = 20;
    _expLvUP = 5;
    self.cleanStats;
    return self;
}
-(void)addExperiance: (int) e{
    _exp = _exp + e;
    while(_exp>_expLvUP)
    {
        _lvl++;
        _expLvUP=5^_lvl;
        self.cleanStats;
        _totalStats += 5;
    }
}
-(void)cleanStats{
    _totalHealth = (_health *5);
    _totalMagic = _magic;
    _curDexterity=_dexterity;
    _curStrength =_strength;
    _curMagic = _totalMagic;
    _curHealth = _totalHealth;
}
-(void)resetMana
{
    _curMagic = _curMagic + _spellCost;
}
-(int)playerAttack
{
    _playerDamage = (_strength *1.33) + ((arc4random() % (_lvl * 2)) + 1);
    return _playerDamage;
}
-(int)playerSpell
{
    _spellDamage = (_magic * (_spellCost));
    return _spellDamage;
}

@end
