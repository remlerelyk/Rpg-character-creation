//
//  ViewController.m
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 1/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.totalStats = 10;
    appDelegate.strength = 8;
    appDelegate.dexterity = 8;
    appDelegate.health = 8;
    appDelegate.magic = 8;
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
    
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", appDelegate.strength]];
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", appDelegate.dexterity]];
    [_healthLabel setText:[NSString stringWithFormat:@"HP: %i", appDelegate.health]];
    [_magicLabel setText:[NSString stringWithFormat:@"MP: %i", appDelegate.magic]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)femaleImageButton:(UIButton *)sender
{
    
}


- (IBAction)magicMinusButton:(UIButton *)sender
{
    if(appDelegate.magic >1)
    {
        appDelegate.magic -= 1;
        appDelegate.totalStats += 1;
    }
    [_magicLabel setText:[NSString stringWithFormat:@"MP: %i", appDelegate.magic]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}

- (IBAction)magicPositiveButton:(UIButton *)sender
{
    if(appDelegate.totalStats > 0)
    {
        appDelegate.magic += 1;
        appDelegate.totalStats -= 1;
    }
    [_magicLabel setText:[NSString stringWithFormat:@"MP: %i", appDelegate.magic]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}
- (IBAction)strengthMinusButton:(UIButton *)sender
{
    if(appDelegate.strength > 1)
    {
        appDelegate.strength -= 1;
        appDelegate.totalStats += 1;
    }
    
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", appDelegate.strength]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}

- (IBAction)strengthPositiveButton:(UIButton *)sender
{
    if(appDelegate.totalStats > 0)
    {
        appDelegate.strength += 1;
        appDelegate.totalStats -= 1;
    }
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", appDelegate.strength]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}

- (IBAction)dexterityMinusButton:(UIButton *)sender
{
    if(appDelegate.dexterity > 1)
    {
        appDelegate.dexterity -= 1;
        appDelegate.totalStats += 1;
    }
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", appDelegate.dexterity]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}

- (IBAction)dexterityPositiveButton:(UIButton *)sender
{
    if(appDelegate.totalStats > 0)
    {
        appDelegate.dexterity += 1;
        appDelegate.totalStats -= 1;
    }
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", appDelegate.dexterity]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}

- (IBAction)healthMinusButton:(UIButton *)sender
{
    if(appDelegate.health > 1)
    {
        appDelegate.health -= 1;
        appDelegate.totalStats += 1;
    }
    [_healthLabel setText:[NSString stringWithFormat:@"HP: %i", appDelegate.health]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}

- (IBAction)healthPositiveButton:(UIButton *)sender
{
    if(appDelegate.totalStats > 0)
    {
        appDelegate.health += 1;
        appDelegate.totalStats -= 1;
    }
    [_healthLabel setText:[NSString stringWithFormat:@"HP: %i", appDelegate.health]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
}
- (IBAction)maleImageButton:(UIButton *)sender
{
    
}

@end
