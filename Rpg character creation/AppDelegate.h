//
//  AppDelegate.h
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 1/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Player.h"
#import "Enemy.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property Player * Player;
@property AVAudioPlayer * music;
@property AVAudioPlayer * sfx;
@property BOOL isMusic,isLeft;
@property BOOL enemyAlive;
@property BOOL overdriveUsed;
@property Enemy * Enemy;
@property (strong, nonatomic) UIWindow *window;
@property int expLvl,BarProgress;

@end
