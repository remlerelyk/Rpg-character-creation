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
    Enemy * enemy;
}
@property int totalHealth;
@property int totalMagic;
@property int currentHealth;
@property int currentMagic;
@property BOOL overdriveUsed;
- (IBAction)Attack:(UIButton *)sender;
@property NSString * audioPath,* hit,* death,* cure,* uwin;
@property (nonatomic, strong) NSString * attackString;
@property NSURL * audioURL,* audioSFX;
@property UIImageView *Animation, * baddy,* magicLayer;
@property NSArray * mWalk,* mWin,* fWalk,* fWin,* uWalk,* uWin;
@property (weak, nonatomic) IBOutlet UILabel *enemyDamageLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyHealthLabel;
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
@property (weak, nonatomic) IBOutlet UILabel *attackLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerDamageLabel;
@property (weak, nonatomic) IBOutlet UILabel *manaLabel;

@property UIImage * Temp,* uIdle;
@property BOOL buttonPress;
@property Enemy * bob;
@end
