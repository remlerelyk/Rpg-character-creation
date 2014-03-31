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
    _width = img.size.width*2;
    _height = img.size.height*2;
    _Lvl=Lvl;
    _Str=((arc4random()%4)+_Lvl)*(_Lvl/6);
    if(_Str <= 1)
    {
        _Str = 1;
    }
    _Dex=((arc4random()%4)+_Lvl)*(_Lvl/3);
    if(_Dex <= 1)
    {
        _Dex = 1;
    }
    _Con=(((arc4random()%4)+_Lvl)*(_Lvl/2));
    if(_Con <= 1)
    {
        _Con = 1;
    }
    if(_Lvl > 1)
    {
        _Exp=pow((_Lvl * 2), 1.4);//(1), 6(p15), 17(p25), 27(p36), 39(p47), 53(p59)
        NSLog(@"Enemy exp gained %i", _Exp);
        //NSLog(@"Lvl:%i\nStr:%i\nDex:%i\nCon:%i\n",_Lvl,_Str,_Dex,_Con);
    }
    else
    {
        _Exp = 1;
    }    return self;
}
-(id)initMechanic:(int) Lvl{
    _img = [UIImage imageNamed:@"baddy.gif"];
    _width = _img.size.width*2;
    _height = _img.size.height*2;
    _Lvl=Lvl;
    _Str=((arc4random()%4)+_Lvl)*(_Lvl/3);//1 * .1 * 1 + 3
    if(_Str <= 1)
    {
        _Str = 1;
    }
    _Dex=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Con=((arc4random()%4)+1)*.1*_Lvl*_Lvl+3;
    _Exp=56*(_Lvl-1)*(_Lvl-1)-257*(_Lvl-1)+280;
    NSLog(@"Lvl:%i\nStr:%i\nDex:%i\nCon:%i\n",_Lvl,_Str,_Dex,_Con);
    return self;
}
-(int)enemyAttack
{
                    //(3 *       1 / 2 + 1)/(5)
    _enemyDamage = (_Str *1.33) + (arc4random() % _Str + 1);
   if(_enemyDamage <= 1)
    {
        _enemyDamage = 1;
    }
    return _enemyDamage;
}

@end
