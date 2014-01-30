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
    _Str=.2*_Lvl*_Lvl+3;
    _Dex=.2*_Lvl*_Lvl+3;
    _Con=.2*_Lvl*_Lvl+3;
    return self;
}

@end
