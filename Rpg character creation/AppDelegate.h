//
//  AppDelegate.h
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 1/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property int totalStats;
@property int strength;
@property int dexterity;
@property int totalHealth;
@property int currentHealth;
@property int totalMagic;
@property int currentMagic;


@property (strong, nonatomic) UIWindow *window;

@end
