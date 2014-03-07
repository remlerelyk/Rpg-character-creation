//
//  Enemy.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Enemy : NSObject

@property int Str,Dex,Con,Lvl,Exp,enemyDamge;
-(id)initWithLv:(int) Lvl;
-(int) enemyAttack;
@end
