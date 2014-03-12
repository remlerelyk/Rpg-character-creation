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
@interface ViewControllerMain : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate *appDelegate;
    Enemy * enemy;
}
@property int totalHealth;
@property int totalMagic;
@property int currentHealth;
@property int currentMagic;
- (IBAction)Attack:(UIButton *)sender;
@property NSString * audioPath,* hit,* death,* cure,* uwin;
@property NSURL * audioURL,* audioSFX;
@property UIImageView *Animation, * baddy;
@property NSArray * mWalk,* mWin,* fWalk,* fWin,* uWalk,* uWin;
@property (weak, nonatomic) IBOutlet UILabel *enemyDamageLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyHealthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@property UIImage * Temp,* uIdle;
@property BOOL buttonPress;
@property Enemy * bob;
@end
