//
//  Enemy.m
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

-(id)initWithLv:(int) Lvl{
    _Lvl=Lvl;
    _Str=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;//1 * .1 * 1 + 3
    _Dex=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Con=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Exp=56*(_Lvl-1)*(_Lvl-1)-257*(_Lvl-1)+280;
    NSLog(@"Lvl:%i\nStr:%i\nDex:%i\nCon:%i\n",_Lvl,_Str,_Dex,_Con);
    return self;
}
-(int)enemyAttack
{
                    //(3 *       1 / 2 + 1)/(5)
    _enemyDamge = (_Str * ((arc4random() % 10 + 1)/ 2) + (arc4random() % 5 +1))/ (arc4random() % 3 + 5);
    if( _enemyDamge <= 1)
    {
        _enemyDamge = 1;
    }
    return _enemyDamge;
}
@end
