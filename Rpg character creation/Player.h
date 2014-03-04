//
//  Experience.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property int exp,lvl,expLvUP,magic,strength,dexterity,health,curMagic,curStrength,curDexterity,curHealth,totalStats;
-(void)addExperiance: (int) e;
-(void)cleanStats;
@end
