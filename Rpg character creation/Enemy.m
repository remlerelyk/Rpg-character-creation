//
//  Enemy.m
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/28/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

-(id)initWithLv:(int) Lvl andWith:(UIImage *) img{
    _img = img;
    _width = img.size.width;
    _height = img.size.height;
    _Lvl=Lvl;
    _Str=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Dex=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Con=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Exp=56*(_Lvl-1)*(_Lvl-1)-257*(_Lvl-1)+280;
    NSLog(@"Lvl:%i\nStr:%i\nDex:%i\nCon:%i\n",_Lvl,_Str,_Dex,_Con);
    return self;
}
-(id)initMechanic:(int) Lvl{
    _img = [UIImage imageNamed:@"baddy.gif"];
    _width = _img.size.width*2;
    _height = _img.size.height*2;
    _Lvl=Lvl;
    _Str=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Dex=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Con=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Exp=56*(_Lvl-1)*(_Lvl-1)-257*(_Lvl-1)+280;
    NSLog(@"Lvl:%i\nStr:%i\nDex:%i\nCon:%i\n",_Lvl,_Str,_Dex,_Con);
    return self;
}

@end
