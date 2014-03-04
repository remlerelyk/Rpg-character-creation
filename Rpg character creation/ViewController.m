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
    _male = YES;
    [_characterImage setImage:[UIImage imageNamed:@"male.png"]];
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.totalStats = 10;
    appDelegate.strength = 8;
    appDelegate.dexterity = 8;
    appDelegate.totalHealth = 8;
    appDelegate.totalMagic = 8;
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
    [_descriptionTextView setText:@""];
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", appDelegate.strength]];
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", appDelegate.dexterity]];
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", appDelegate.totalHealth]];
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", appDelegate.totalMagic]];
    _Test=[[Enemy alloc]initWithLv:2];
    _Test2=[[Enemy alloc]initWithLv:10];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)femaleImageButton:(UIButton *)sender
{
    if(_male == YES)
    {
        [_characterImage setImage:[UIImage imageNamed:@"female.png"]];
        _male = NO;
    }
}


- (IBAction)magicMinusButton:(UIButton *)sender
{
    if(appDelegate.totalMagic >1)
    {
        appDelegate.totalMagic -= 1;
        appDelegate.totalStats += 1;
    }
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", appDelegate.totalMagic]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
    [_descriptionTextView setText:@"This stat affects how much MP or magic points you have. It also Increases damage done by spells."];
}

- (IBAction)magicPositiveButton:(UIButton *)sender
{
    if(appDelegate.totalStats > 0)
    {
        appDelegate.totalMagic += 1;
        appDelegate.totalStats -= 1;
    }
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", appDelegate.totalMagic]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
    [_descriptionTextView setText:@"This stat affects how much MP or magic points you have. It also Increases damage done by spells. When you're MP reaches 0 you can no longer cast any spells, and you must either level up or use a mana potion to restore it."];
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
    [_descriptionTextView setText:@"This stat affects how much damage you deal with weapons"];
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
    [_descriptionTextView setText:@"This stat affects how much damage you deal with weapons"];
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
    [_descriptionTextView setText:@"This stat affects who goes first in the combat phase, it also affects your critical hit chance."];
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
    [_descriptionTextView setText:@"This stat affects who goes first in the combat phase, it also affects your critical hit chance."];
}

- (IBAction)healthMinusButton:(UIButton *)sender
{
    if(appDelegate.totalHealth > 1)
    {
        appDelegate.totalHealth -= 1;
        appDelegate.totalStats += 1;
    }
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", appDelegate.totalHealth]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
    [_descriptionTextView setText:@"This stat affects how much health you have, when you're health reaches 0 you lose, use a health potion or level up to restore your health."];
}

- (IBAction)healthPositiveButton:(UIButton *)sender
{
    if(appDelegate.totalStats > 0)
    {
        appDelegate.totalHealth += 1;
        appDelegate.totalStats -= 1;
    }
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", appDelegate.totalHealth]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", appDelegate.totalStats]];
    [_descriptionTextView setText:@"This stat affects how much health you have, when you're health reaches 0 you lose, use a health potion or level up to restore your health."];
}
- (IBAction)maleImageButton:(UIButton *)sender
{
    if(_male != YES)
    {
        [_characterImage setImage:[UIImage imageNamed:@"male.png"]];
        _male = YES;
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"beginSegue"])
    {
        ViewControllerMain * destViewController = segue.destinationViewController;
        appDelegate.currentHealth = appDelegate.totalHealth;
        appDelegate.currentMagic = appDelegate.totalHealth;
        destViewController.totalHealth = appDelegate.totalHealth;
        destViewController.totalMagic = appDelegate.totalMagic;
        destViewController.currentHealth = appDelegate.currentHealth;
        destViewController.currentMagic = appDelegate.currentMagic;
    }
}

@end
