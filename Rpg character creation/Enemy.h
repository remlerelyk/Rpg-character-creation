//
//  Enemy.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
@interface Enemy : NSObject

@property int Str,Dex,Con,Lvl,Exp,width,height, enemyDamage;
@property UIImage * img;

-(int)enemyAttack;
-(id)initWithLv:(int) Lvl andWith:(UIImage *) img;
-(id)initMechanic:(int) Lvl;

@end
