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
    _totalStats = 4;
    _expLvUP = 1;
    _numberOfHits = 1;
    self.cleanStats;
    return self;
}
-(void)addExperiance: (int) e
{
    _exp +=e;
    //NSLog(@"Exp:%i", _exp);
    /*if(_exp >= _expLvUP)
    {
        
        NSLog(@"Lvl: %i", _lvl);
        _expLvUP = pow(_lvl, 2);
        NSLog(@"Exp to Lvl up:%i", _expLvUP);
        _levelUpTrue = TRUE;
        _exp = 0;
    }*/
}
-(void)levelUp
{
    if(_exp >= _expLvUP)
    {
        NSLog(@"Lvl up");
        _lvl++;
        
        _totalStats += 1;
        switch (_lvl)
        {
                
            case 96 ... 100:
                _strength += 0 + arc4random() % 10;
                _dexterity += 0 + arc4random() % 10;
                _health += 0 + arc4random() % 10;
                _magic += 0 + arc4random() % 10;
                break;
            case 91 ... 95:
                _strength += 5 + arc4random() % 3;
                _dexterity += 5 + arc4random() % 3;
                _health += 5 + arc4random() % 3;
                _magic += 5 + arc4random() % 3;
                break;
            case 86 ... 90:
                _strength += 5 + arc4random() % 4;
                _dexterity += 5 + arc4random() % 4;
                _health += 5 + arc4random() % 4;
                _magic += 5 + arc4random() % 4;
                break;
            case 81 ... 85:
                _strength += 10+ arc4random() % 5;
                _dexterity += 0 + arc4random() % 5;
                _health += 0 + arc4random() % 5;
                _magic += 0 + arc4random() % 5;
                break;
            case 76 ... 80:
                _strength += 0 + arc4random() % 3;
                _dexterity += 0 + arc4random() % 3;
                _health += 0 + arc4random() % 3;
                _magic += 0 + arc4random() % 3;
                break;
            case 71 ... 75:
                _strength += 0 + arc4random() % 4;
                _dexterity += 0 + arc4random() % 4;
                _health += 0 + arc4random() % 4;
                _magic += 0 + arc4random() % 4;
                break;
            case 66 ... 70:
                _strength += 0 + arc4random() % 6;
                _dexterity += 0 + arc4random() % 6;
                _health += 0 + arc4random() % 6;
                _magic += 0 + arc4random() % 6;
                break;
            case 61 ... 65:
                _strength += 0 + arc4random() % 5;
                _dexterity += 0 + arc4random() % 5;
                _health += 0 + arc4random() % 5;
                _magic += 0 + arc4random() % 5;
            case 56 ... 60:
                _strength += 0 + arc4random() % 6;
                _dexterity += 0 + arc4random() % 6;
                _health += 0 + arc4random() % 6;
                _magic += 0 + arc4random() % 6;
                break;
            case 51 ... 55:
                _strength += 0 + arc4random() % 7;
                _dexterity += 0 + arc4random() % 7;
                _health += 0 + arc4random() % 7;
                _magic += 0 + arc4random() % 7;
                break;
            case 46 ... 50:
                _strength += 3 + arc4random() % 3;
                _dexterity += 3 + arc4random() % 3;
                _health += 3 + arc4random() % 3;
                _magic += 3 + arc4random() % 3;
                break;
            case 41 ... 45:
                _strength += 1 + arc4random() % 1;
                _dexterity += 1 + arc4random() % 1;
                _health += 3 + arc4random() % 1;
                _magic += 3 + arc4random() % 1;
                break;
            case 36 ... 40:
                _strength += 2 + arc4random() % 2;
                _dexterity += 2 + arc4random() % 2;
                _health += 2 + arc4random() % 2;
                _magic += 2 + arc4random() % 2;
                break;
            case 31 ... 35:
                _strength += 2 + arc4random() % 3;
                _dexterity += 2 + arc4random() % 3;
                _health += 2 + arc4random() % 3;
                _magic += 2 + arc4random() % 3;
            case 26 ... 30:
                _strength += 2 + arc4random() % 5;
                _dexterity += 2 + arc4random() % 5;
                _health += 3 + arc4random() % 5;
                _magic += 3 + arc4random() % 5;
                break;
            case 21 ... 25:
                _strength += 1 + arc4random() % 2;
                _dexterity += 2 + arc4random() % 2;
                _health += 3 + arc4random() % 2;
                _magic += 3 + arc4random() % 2;
                break;
            case 16 ... 20:
                _strength += 2 + arc4random() % 3;
                _dexterity += 1 + arc4random() % 3;
                _health += 3 + arc4random() % 3;
                _magic += 3 + arc4random() % 3;
                break;
            case 11 ... 15:
                _strength += 2 + arc4random() % 2;
                _dexterity += 1 + arc4random() % 2;
                _health += 1 + arc4random() % 2;
                _magic += 1 + arc4random() % 2;
                break;
            case 6 ... 10:
                _strength += 2 + arc4random() % 2;
                _dexterity += 1 + arc4random() % 2;
                _health += 4 + arc4random() % 2;
                _magic += 4 + arc4random() % 2;
                break;
            case 1 ... 5:
                _strength += 1 + arc4random() % 2;
                _dexterity += 2 + arc4random() % 2;
                _health += 2 + arc4random() % 2;
                _magic += 2 + arc4random() % 2;
                break;
        default:
            break;
        }
        _expLvUP = pow(_lvl, 2);
        _exp = 0;
        self.cleanStats;
    }
    else
    {
        NSLog(@"Cant level up");
    }
    

}
-(void)cleanStats{
    _totalHealth = (_health *5);
    _totalMagic = (_magic * 3);
    _curDexterity=_dexterity;
    _curStrength =_strength;
    _curMagic = _totalMagic;
    _curHealth = _totalHealth;
    _numberOfHits = _dexterity/13 + 1;
    if(_numberOfHits > 8)
    {
        _numberOfHits = 8;
    }
    

}
-(void)resetMana
{
    _curMagic = _curMagic + _spellCost;
}
-(int)playerAttack
{
    _playerDamage = ((((_strength) * _numberOfHits) + (arc4random() % _lvl/2 + 1))/2);
    return _playerDamage;
}
-(int)playerSpell
{
    _spellDamage = (_magic) * (_spellCost);
    return _spellDamage;
}

@end
