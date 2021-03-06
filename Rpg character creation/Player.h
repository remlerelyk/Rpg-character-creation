//
//  Experience.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

@interface Player : NSObject
@property int exp,lvl,expLvUP,magic,strength,dexterity,health,totalHealth,totalMagic,curMagic,curStrength,curDexterity,curHealth,totalStats, spellCost, playerDamage, spellDamage, damageTaken, numberOfHits;
@property (nonatomic, strong) NSString * curMagicSkill;
@property float amoutOfProgress;
@property BOOL isMale, isFrozen,lvlUp;

-(void)addExperiance: (int) e;
-(void)cleanStats;
-(void)resetMana;
-(void)levelUp;
-(int)playerAttack;
-(int)playerSpell;
@end
