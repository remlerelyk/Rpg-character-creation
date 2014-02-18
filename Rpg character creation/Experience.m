//
//  Experience.m
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "Experience.h"

@implementation Experience
-(id)init{
    _exp = 0;
    _lvl = 1;
    _expLvUP=56*_lvl*_lvl-257*_lvl+280;
    return self;
}
-(void)addExperiance: (int) e{
    _exp = _exp + e;
    while(_exp>_expLvUP){
        _lvl++;
        _expLvUP=5^_lvl;
    }
}


@end
