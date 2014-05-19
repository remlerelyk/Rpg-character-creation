//
//  ExpController.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 3/21/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface ExpController : UIViewController
{
    AppDelegate * appDelegate;
}
- (IBAction)leaveView:(UIButton *)sender;
@property UIImageView * Frame,* exp;
@property NSString * iWin,* Win;
@property NSURL * audioURL,* audioSFX;


@property (weak, nonatomic) IBOutlet UILabel *statDescribeLabel;
@property (weak, nonatomic) IBOutlet UILabel *strengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelUpLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelNewAbility;
@property (weak, nonatomic) IBOutlet UILabel *dexterityLabel;
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
@property (weak, nonatomic) IBOutlet UILabel *magicLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

- (IBAction)strengthMinusButton:(UIButton *)sender;
- (IBAction)strengthPositiveButton:(UIButton *)sender;
- (IBAction)dexterityMinusButton:(UIButton *)sender;
- (IBAction)dexterityPositiveButton:(UIButton *)sender;
- (IBAction)healthMinusButton:(UIButton *)sender;
- (IBAction)healthPositiveButton:(UIButton *)sender;
- (IBAction)magicMinusButton:(UIButton *)sender;
- (IBAction)magicPositiveButton:(UIButton *)sender;

@end
