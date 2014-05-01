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
    while(_exp >= _expLvUP)
    {
        
        NSLog(@"Lvl: %i", _lvl);
        _expLvUP = pow(_lvl, 2);
        NSLog(@"Exp to Lvl up:%i", _expLvUP);
        self.levelUp;
       
        
    }
}
-(void)levelUp
{
    _lvl++;
    _totalStats += 1;
    switch (_lvl)
    {
        case 26 ... 30:
            _strength += 1;
            _dexterity += 1;
            _health += 1;
            _magic += 1;
            break;
        case 21 ... 25:
            _strength += 1;
            _dexterity += 1;
            _health += 1;
            _magic += 1;
            break;
        case 16 ... 20:
            _strength += 1;
            _dexterity += 1;
            _health += 1;
            _magic += 1;
            break;
        case 11 ... 15:
            _strength += 1;
            _dexterity += 1;
            _health += 1;
            _magic += 1;
            break;
        case 6 ... 10:
            _strength += 1;
            _dexterity += 1;
            _health += 1;
            _magic += 1;
            break;
        case 1 ... 5:
            _strength += 1 + arc4random() % 2;
            _dexterity += 1 + arc4random() % 2;
            _health += 1 + arc4random() % 2;
            _magic += 1 + arc4random() % 2;
            break;
            
        default:
            break;
    }
     _exp = 0;
    self.cleanStats;
    

}
-(void)cleanStats{
    _totalHealth = (_health *5);
    _totalMagic = _magic;
    _curDexterity=_dexterity;
    _curStrength =_strength;
    _curMagic = _totalMagic;
    _curHealth = _totalHealth;
    _numberOfHits = _dexterity/13 + 1;
    

}
-(void)resetMana
{
    _curMagic = _curMagic + _spellCost;
}
-(int)playerAttack
{
    _playerDamage = ((_strength * 2) * _numberOfHits) + (arc4random() % _lvl/2 + 1);
    return _playerDamage;
}
-(int)playerSpell
{
    _spellDamage = (_magic) * (_spellCost);
    return _spellDamage;
}

@end
