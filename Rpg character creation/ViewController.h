//
//  ViewController.h
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 1/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Enemy.h"
#import "ViewControllerMain.h"
@interface ViewController : UIViewController
{
    AppDelegate * appDelegate;
}

@property Enemy * Test,* Test2;
@property (weak, nonatomic) IBOutlet UILabel *statDescribeLabel;
@property (weak, nonatomic) IBOutlet UILabel *strengthLabel;
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
@property (weak, nonatomic) IBOutlet UIButton *magicMinusButton;
@property (weak, nonatomic) IBOutlet UIButton *magicPositiveButton;
@property (weak, nonatomic) IBOutlet UIImageView *characterImage;
- (IBAction)maleImageButton:(UIButton *)sender;
- (IBAction)femaleImageButton:(UIButton *)sender;
- (IBAction)magicMinusButton:(UIButton *)sender;
- (IBAction)magicPositiveButton:(UIButton *)sender;
//User properties
@property bool male;


@end
