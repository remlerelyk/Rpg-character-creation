//
//  ViewControllerMain.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MagicViewController.h"
#import "ViewController.h"
#import "Player.h"
#import "Enemy.h"
#import "ExpController.h"
@interface ViewControllerMain : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate *appDelegate;
    //Enemy * enemy;

}
@property int totalHealth;
@property int totalMagic;
@property int currentHealth;
@property int currentMagic;
@property int frozenChance;
@property BOOL overdriveUsed;
- (IBAction)Attack:(UIButton *)sender;
- (IBAction)Overdrive:(UIButton *)sender;
- (IBAction)Magic:(UIButton *)sender;
@property NSString * audioPath,* hit,* death,* cure;
@property (nonatomic, strong) NSString * attackString;
@property NSURL * audioURL,* audioSFX;
@property UIImageView *Animation, * baddy,* baddyTwo,* baddyThree, * baddyFour, * selector, * magicLayer;
@property NSArray * mWalk,* mWin,* fWalk,* fWin,* uWalk,* uWin;
@property (weak, nonatomic) IBOutlet UILabel *enemyDamageLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerDamageLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *playerDamageLabelThree;

@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
@property (weak, nonatomic) IBOutlet UILabel *attackLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerDamageLabel;
@property (weak, nonatomic) IBOutlet UILabel *manaLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerHealLabel;

@property UIImage * Temp, *TempTwo,*TempThree, * TempFour, * uIdle;
@property BOOL buttonPress;
@property Enemy * bob;
@property Enemy * jack;
@property Enemy * Jill;
@property Enemy * Shinryu;
@property NSSet * theSet;

@end
