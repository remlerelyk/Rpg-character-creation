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
@interface ViewControllerMain : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate *appDelegate;
}
@property int totalHealth;
@property int totalMagic;
@property int currentHealth;
@property int currentMagic;
@property NSMutableArray * showDataArray;
@property (nonatomic, strong) IBOutlet UITableView * tableData;
- (IBAction)Attack:(UIButton *)sender;
@property NSString * audioPath,* hit,* death,* cure,* uwin;
@property NSURL * audioURL,* audioSFX;
@property UIImageView *Animation, * baddy;
@property NSArray * mWalk,* mWin,* fWalk,* fWin,* uWalk,* uWin;
@property UIImage * Temp,* uIdle;
@property BOOL buttonPress;
@end
