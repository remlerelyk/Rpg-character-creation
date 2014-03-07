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
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@""];
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", [appDelegate.Player strength]]];
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", [appDelegate.Player dexterity]]];
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", [appDelegate.Player health]]];
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", [appDelegate.Player magic]]];
    _Test=[[Enemy alloc]initWithLv:2];
    _Test2=[[Enemy alloc]initWithLv:10];
    appDelegate.enemyAlive = FALSE;
    
    
     
    
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
        [appDelegate.Player setIsMale:FALSE];
    }
}


- (IBAction)magicMinusButton:(UIButton *)sender
{
    if([appDelegate.Player magic] >1)
    {
        [appDelegate.Player setMagic:[appDelegate.Player magic]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", [appDelegate.Player magic]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much MP or magic points you have. It also Increases damage done by spells."];
    [appDelegate.Player cleanStats];
}

- (IBAction)magicPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setMagic:[appDelegate.Player magic]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];;
    }
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", [appDelegate.Player magic]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much MP or magic points you have. It also Increases damage done by spells. When you're MP reaches 0 you can no longer cast any spells, and you must either level up or use a mana potion to restore it."];
    [appDelegate.Player cleanStats];
}
- (IBAction)strengthMinusButton:(UIButton *)sender
{
    if([appDelegate.Player strength] > 1)
    {
        [appDelegate.Player setStrength:[appDelegate.Player strength]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", [appDelegate.Player strength]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much damage you deal with weapons"];
    [appDelegate.Player cleanStats];
}

- (IBAction)strengthPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setStrength:[appDelegate.Player strength]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];
    }
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", [appDelegate.Player strength]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much damage you deal with weapons"];
    [appDelegate.Player cleanStats];
}

- (IBAction)dexterityMinusButton:(UIButton *)sender
{
    if([appDelegate.Player dexterity] > 1)
    {
        [appDelegate.Player setDexterity:[appDelegate.Player dexterity]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", [appDelegate.Player dexterity]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects who goes first in the combat phase, it also affects your critical hit chance."];
    [appDelegate.Player cleanStats];
}

- (IBAction)dexterityPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setDexterity:[appDelegate.Player dexterity]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];
    }
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", [appDelegate.Player dexterity]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects who goes first in the combat phase, it also affects your critical hit chance."];
    [appDelegate.Player cleanStats];
}

- (IBAction)healthMinusButton:(UIButton *)sender
{
    if([appDelegate.Player health] > 1)
    {
        [appDelegate.Player setHealth:[appDelegate.Player health]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", [appDelegate.Player health]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much health you have, when you're health reaches 0 you lose, use a health potion or level up to restore your health."];
    [appDelegate.Player cleanStats];
}

- (IBAction)healthPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setHealth:[appDelegate.Player health]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];
    }
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", [appDelegate.Player health]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much health you have, when you're health reaches 0 you lose, use a health potion or level up to restore your health."];
    [appDelegate.Player cleanStats];
}
- (IBAction)maleImageButton:(UIButton *)sender
{
    if(_male != YES)
    {
        [_characterImage setImage:[UIImage imageNamed:@"male.png"]];
        _male = YES;
        [appDelegate.Player setIsMale:TRUE];
    }

}

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
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
}*/

@end
